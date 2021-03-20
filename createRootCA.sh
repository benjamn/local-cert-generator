#!/usr/bin/env bash

cd $(dirname "$0")

mkdir -p ../keys

openssl genrsa \
        -des3 \
        -out ../keys/rootCA.key \
        2048

openssl req -x509 -new -nodes \
        -key ../keys/rootCA.key \
        -sha256 \
        -days 365 \
        -out ../keys/rootCA.pem \
        -config server.csr.cnf
