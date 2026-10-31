# Code Review Notes — mta-sts

## What failure looks like here
A policy change that deploys successfully but causes mail delivery failures —
either a premature `enforce` mode, a wrong `mx:` hostname, or a stale
`max_age` that forces receivers to re-fetch before the new policy is live.

## Key invariants the reviewer should check
- `mode:` value matches the intended enforcement state (testing → enforce
  transition requires MX records already validated)
- `mx:` hostnames match the actual MX records for positronikal.tech
- `max_age:` value is appropriate for the enforcement level (lower during
  testing, higher once enforce is confirmed healthy)
- CNAME record still points to `mta-sts.positronikal.tech` served from this repo
- Any policy change should be tested in `testing` mode before `enforce`

## Paths to skip
- `var/` — health reports, not policy content

## Finding standards
- Every finding must cite a specific file and line number
- For this repo, "line number" in the policy files matters — the MTA-STS
  format is line-sensitive
