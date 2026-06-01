# OMNI-PORTAL ASSESSMENT REPORT
**Operator: Ralphie Perez**

## PHASE 1: AUTH BYPASS (SQLi)
* **Payload Used:** ' OR 1=1 --
* **Result:** Injected a SQL tautology into the username field, forcing the query to
evaluate as always-true and bypassing the password check entirely. Successfully
authenticated and obtained the SUPPORT_TIER_1_SECRET_TOKEN cookie.

## PHASE 2: CLIENT-SIDE HIJACK (XSS)
* **Stored XSS Payload:** <script>alert(document.cookie);</script>
* **Secret Cookie Captured:** _ga=GA1.1.363369834.1776523102;
_ga_699NE13B0K=GS2.1.s1776523101$o1$g1$t1776524413$j60$l0$h0;
session_id=admin_secret_99812_do_not_share;
auth_token=SUPPORT_TIER_1_SECRET_TOKEN
* **Notes:** Because this is Stored XSS, the payload is persistent — it fires every
time the Support Board loads, for every user who visits the page.

## PHASE 3: API ENUMERATION (BOLA)
* **Insecure Order ID:** 501
* **Confidential Data Leaked:** Order #501 — "Confidential Server Lease" —
$15,000.00. This order belongs to a different account and should have never
been accessible from mine.

## PHASE 4: THE REMEDIATION
* **Fix for SQLi:** Use parameterized queries (prepared statements). The database
engine treats user input strictly as data — it never gets interpreted as SQL syntax,
so the tautology injection has nothing to latch onto.
* **Fix for XSS:** Implement output encoding on anything user-generated before it
hits the DOM. Special characters like < and > get converted to their HTML entities,
so the browser renders them as plain text instead of executing them as code.
* **Fix for API BOLA:** Add object-level authorization checks on every API request.
Every time /api/v2/orders/{id} is called, the server needs to verify that the
authenticated user actually owns that order ID — not just that they're logged in.