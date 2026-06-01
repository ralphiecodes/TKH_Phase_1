# TITAN SMALL BUSINESS SERVICES: SECURITY ARCHITECTURE DOCUMENT (SAD)
**Operator:** Ralphie Perez
**Date:** May 3, 2026

---

## 1. Perimeter Hardening (UFW & SSH)

### SSH Status
I set up two Docker bridge networks — `frontend` (standard bridge that talks to the host) and `backend` (which I declared with `internal: true` so containers on it can't reach the host or the internet). The `wiki` (nginx) container sits on both networks. I put `db` (mysql) only on the `backend` network with no host port mapping.

This gives me a two-tier setup:
- External traffic only comes in through `wiki` on host port 8080.
- `wiki` reaches `db` over the internal bridge using service-name DNS.
- `db` has no way out to the host or the internet — it's fully air-gapped.

Steps I took to fix `/etc/ssh/sshd_config`:
- `PermitRootLogin no` — root cannot SSH in directly.
- `PasswordAuthentication no` — passwords are rejected; key auth required.
- `PubkeyAuthentication yes` — explicit confirmation of key auth path.

Validation and restart:
sudo sshd -t
sudo systemctl restart ssh

### Firewall Logic
UFW was changed with only default-deny for all inbound traffic and default-allow for anything going out. I opened 2 ports 22 for admin SSH access and 8080 for the app stack.

Commands applied:

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp
sudo ufw enable

Verification (`sudo ufw status verbose`):
- Default: deny (incoming), allow (outgoing)
- 22/tcp ALLOW Anywhere
- 8080/tcp ALLOW Anywhere

## 2. The Automated Auditor (Python)

### Script Logic
The auditor (`dc_auditor.py`) imports the `os` module, pings the documented
TITAN-DC01 IP address four times, and appends a timestamped status line to
the audit log. The exit code from `os.system()` determines whether the
host is reachable: `0` = `DC is UP`, non-zero = `DC is DOWN`.

```python
#!/usr/bin/env python3
import os
import datetime

DC_IP = "192.168.0.X"  # TITAN-DC01 documented address
LOG_FILE = "/var/log/dc_audit.log"

response = os.system(f"ping -c 4 {DC_IP} > /dev/null 2>&1")
timestamp = datetime.datetime.now().isoformat()
status = "DC is UP" if response == 0 else "DC is DOWN"
log_entry = f"[{timestamp}] {status}\n"

with open(LOG_FILE, "a") as f:
    f.write(log_entry)

print(log_entry.strip())
```

### Telemetry Path
`/var/log/dc_audit.log`

The log file was pre-created with operator ownership so the auditor can
append without elevated privileges:

sudo touch /var/log/dc_audit.log
sudo chown USER:USER:
USER:USER /var/log/dc_audit.log
sudo chmod 644 /var/log/dc_audit.log


### Verification Evidence
As it stated in the document, TITAN-DC01 was powered off during execution. The
auditor correctly detected the host as unreachable and logged the failure
state, demonstrating both the ping-detection and append-mode logging:

[2026-05-04T02:51:04.184608] DC is DOWN
[2026-05-04T02:51:04.184608] DC is DOWN

## 3. Containerized App (Docker)

### Network Isolation
I set up two Docker bridge networks for this. The `frontend` network is a standard bridge that's reachable from the host, and the `backend` network I declared with `internal: true` so anything sitting on it can't get out to the host network or the internet. The `wiki` (nginx) container is on both networks, but I put the `db` (mysql) container only on `backend` and didn't map any of its ports to the host.

That gives me a clean two-tier setup:
- The only way external traffic gets in is through `wiki` on host port 8080.
- `wiki` talks to `db` over the internal bridge using the service name as DNS.
- `db` has no route out to the host or the internet — it's fully air-gapped.

### docker-compose.yml
```yaml
services:
  wiki:
    image: nginx:latest
    container_name: wiki_frontend
    ports:
      - "8080:80"
    networks:
      - frontend
      - backend
    restart: unless-stopped

  db:
    image: mysql:8
    container_name: db_backend
    environment:
      MYSQL_ROOT_PASSWORD: outpost_demo_pw
      MYSQL_DATABASE: wiki
    networks:
      - backend
    restart: unless-stopped

networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true
```

### Stack Health
Output of `docker compose ps`:
NAME            IMAGE          SERVICE   STATUS         PORTS
db_backend      mysql:8        db        Up X minutes   3306/tcp, 33060/tcp
wiki_frontend   nginx:latest   wiki      Up X minutes   0.0.0.0:8080->80/tcp

### Verification Evidence

**Frontend reachable from host (expected: 200 OK):**
curl -I http://localhost:8080
HTTP/1.1 200 OK
Server: nginx/1.29.8
**Backend isolated from host (expected: connection failure):**
curl --max-time 3 http://localhost:3306
curl: (7) Failed to connect to localhost port 3306: Couldn't connect to server

Connection refused confirms the air-gap — no host port is bound for MySQL.

**Frontend can reach backend internally (expected: DNS resolves):**
docker exec wiki_frontend getent hosts db
172.22.0.2      db
**Backend network declared internal (proof of air-gap config):**
docker network inspect outpost-stack_backend | grep -i internal
"Internal": true,

## Phase 4: Containerized Application Stack

### Architecture
A two-service stack deployed via Docker Compose:
- `wiki` (nginx:latest) — public-facing reverse proxy / web tier,
  bound to host port 8080, joined to both `frontend` and `backend`.
- `db` (mysql:8) — backend database, joined only to the internal
  `backend` network with no host port exposure.

### Air-Gap Implementation
The `backend` network is declared with `internal: true`, which prevents
any container on it from accessing the host network or external internet.
The `db` service exists exclusively on this network, making it
unreachable from outside the Docker bridge. The `wiki` container is the
only ingress/egress point and serves as the controlled gateway between
external traffic and the database tier.

### Verification Evidence

Frontend exposure (host → wiki):
$ curl -I http://localhost:8080
HTTP/1.1 200 OK
Server: nginx/1.29.8

Backend isolation (host → db, expected to fail):
$ curl --max-time 3 http://localhost:3306
curl: (7) Failed to connect to localhost port 3306
(Connection refused confirms air-gap — port not bound on host.)

Internal reachability (wiki → db over backend):
$ docker exec wiki_frontend getent hosts db
172.22.0.2      db

Network configuration:
$ docker network inspect outpost-stack_backend | grep -i internal
        "Internal": true,

### docker-compose.yml
version: '3.8'


services:
    db:
      image: mariadb:latest
      environment:
        MYSQL_ROOT_PASSWORD:supersecretpassword
      volumes:
        - db_data:/var/lib/mysql
      networks:
        - private_net



    web:
      image: wordpress:latest
      ports:
        - "80:80"
      networks:
        - public_net
        - private_net


    volumes:
      db_data:

    networks:
      public_net:
      private_net:
        internal: true




## 4. Executive Summary

All three layers — perimeter, telemetry, and application — are deployed and verified. Here's what the setup actually does:

- UFW gives me network-level access control with a default-deny posture.
- SSH only accepts key-based logins and root can't log in remotely.
- The auditor keeps an ongoing log of whether the DC is reachable, with timestamps.
- The Docker stack air-gaps the database from anything outside the backend network.

I built this around least-privilege and defense-in-depth, but kept it simple enough that a single operator can run it. For a small-business outpost where I'm the only engineer, keeping the architecture easy to maintain matters just as much as locking it down.