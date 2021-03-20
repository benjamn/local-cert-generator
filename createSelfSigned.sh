#!/usr/bin/env bash

cd $(dirname "$0")

mkdir -p ../keys

openssl req \
        -new \
        -sha256 \
        -nodes \
        -out ../keys/server.csr \
        -newkey rsa:2048 \
        -keyout ../keys/server.key \
        -config server.csr.cnf

openssl x509 \
        -req \
        -in ../keys/server.csr \
        -CA ../keys/rootCA.pem \
        -CAkey ../keys/rootCA.key \
        -CAcreateserial \
        -out ../keys/server.crt \
        -days 500 \
        -sha256 \
        -extfile v3.ext
