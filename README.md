# mta-sts

Hosts the MTA-STS policy file for `positronikal.tech`, served via GitHub Pages
at `https://mta-sts.positronikal.tech/.well-known/mta-sts.txt`.

## Policy

See `.well-known/mta-sts.txt`. Mail to `@positronikal.tech` is delivered via
Google Workspace (`aspmx.l.google.com` and `*.aspmx.l.google.com`).

## Changing the policy

Per RFC 8461, any change to `.well-known/mta-sts.txt` must be paired with a
new `id` value in the `_mta-sts.positronikal.tech` TXT record, so that
sending servers know to re-fetch the policy.

Currently in `mode: testing`. Move to `mode: enforce` after a monitoring
period of clean TLS-RPT reports.
