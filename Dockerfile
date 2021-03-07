ARG PYTHON_VERSION=3.9
ARG ALPINE_VERSION=3.13

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION} AS builder

RUN apk add --no-cache g++

RUN pip install --user --no-cache-dir python-Levenshtein==0.12.*

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

COPY --from=builder /root/.local/lib/ /usr/local/lib/
