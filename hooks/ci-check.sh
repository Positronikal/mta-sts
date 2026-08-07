#!/usr/bin/env bash
# Single source of truth for CI checks.
# Invoked locally by hooks/pre-push (blocking).
# Validates the MTA-STS policy file structure per RFC 8461.
set -e

POLICY=".well-known/mta-sts.txt"

if [ ! -f "$POLICY" ]; then
    echo "ERROR: $POLICY not found"
    exit 1
fi

for field in version mode mx max_age; do
    if ! grep -q "^${field}:" "$POLICY"; then
        echo "ERROR: $POLICY missing required field: ${field}"
        exit 1
    fi
done

VERSION=$(grep "^version:" "$POLICY" | cut -d' ' -f2 | tr -d '[:space:]')
if [ "$VERSION" != "STSv1" ]; then
    echo "ERROR: $POLICY version must be 'STSv1', got '${VERSION}'"
    exit 1
fi

MODE=$(grep "^mode:" "$POLICY" | cut -d' ' -f2 | tr -d '[:space:]')
if [ "$MODE" != "testing" ] && [ "$MODE" != "enforce" ] && \
   [ "$MODE" != "none" ]; then
    echo "ERROR: $POLICY mode must be testing, enforce, or none; got '${MODE}'"
    exit 1
fi

echo "ci-check passed. MTA-STS policy valid (mode: ${MODE})."
