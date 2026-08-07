# Contributing

This repository hosts the MTA-STS and TLS-RPT policy configuration for
`positronikal.tech`. External contributions are not expected, but corrections
or improvements are welcome.

## How to Contribute

1. Fork the repository.
2. Create a feature branch (`git checkout -b fix/your-fix`).
3. Make your changes and commit them following
   [Conventional Commits](https://www.conventionalcommits.org/).
4. Submit a pull request with a clear description of the change and why.

## Policy Changes

Any change to `.well-known/mta-sts.txt` must be accompanied by a bump to the
`id` field in the `_mta-sts.positronikal.tech` DNS TXT record, per RFC 8461.
Document the change and the new `id` value in the commit message.

## Coding Standards

This project follows the
[Positronikal Coding Standards](https://github.com/Positronikal/PositronikalCodingStandards).
