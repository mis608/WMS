#!/usr/bin/env bash
set -euo pipefail

# The free plan has no pre-deploy command; migrate before starting its single instance.
python manage.py migrate --noinput
exec daphne --proxy-headers -b 0.0.0.0 -p "${PORT:-8008}" greaterwms.asgi:application
