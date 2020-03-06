ARG PYTHON_VERSION=3.8
ARG ALPINE_VERSION=3.11

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION} AS builder

RUN apk add --no-cache g++

RUN pip install --user --no-cache-dir python-Levenshtein==0.12.*

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

COPY --from=builder /root/.local/lib/python3.8/site-packages/ \
	/usr/local/lib/python3.8/site-packages/
