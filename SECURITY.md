# Security Policy

Please do not open a public issue for a vulnerability or an exposed credential.
Report it privately to **vigor.workouch@gmail.com** with reproduction steps and
the affected version. Do not access, alter, or retain other users' data while
researching an issue.

The maintainers will acknowledge a report as soon as practical, investigate it,
and coordinate disclosure after a fix is available. No bug-bounty payment is
promised.

Only client-safe identifiers belong in the mobile app. Supabase secret/service
role keys, RevenueCat secret keys, signing credentials, and upstream exercise API
keys must remain in a secret manager and must never be committed.
