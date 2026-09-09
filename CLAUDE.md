# CLAUDE.md — mta-sts

> Cross-session context: vault `_meta/CURRENT_STATE.md` and `_meta/Logs/SESSION_LOG.md`

MTA-STS and TLS-RPT policy files for `positronikal.tech`. Served via GitHub Pages at `mta-sts.positronikal.tech`. Under `Positronikal` GitHub org.

## Contents

- `.well-known/mta-sts.txt` — MTA-STS policy (`mode: enforce`; MX = Google Workspace; max_age 604800)
- `CNAME` — custom domain record

## Operations

Policy changes require bumping the `id` field in `_mta-sts` DNS TXT record (`v=STSv1; id=YYYYMMDDNN`) so receiving MTAs re-fetch the policy. To promote from `mode: testing` to `mode: enforce`: confirm a clean monitoring period via TLS-RPT reports first (see vault `05-SECURITY/TLSRPT_REVIEW_GUIDE.md`).

## Branch Protection

Phase 1 branch protection applied 2026-06-20. No hooks or CI workflow — content-only repo with no build step or testable artifacts.
