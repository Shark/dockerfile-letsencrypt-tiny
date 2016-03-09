FROM alpine:3.3

RUN acme_tiny_revision="f61f72c212cea27f388eb4a26ede0d65035bdb53" && \
    apk add --update python3 bash openssl ca-certificates git && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    tempdir=$(mktemp -d) && \
    cd $tempdir && \
    git clone https://github.com/diafygi/acme-tiny.git && \
    cd $tempdir/acme-tiny && \
    git checkout $acme_tiny_revision && \
    cp acme_tiny.py /usr/local/bin/acme_tiny.py && \
    chmod +x /usr/local/bin/acme_tiny.py && \
    cd / && \
    rm -r $tempdir && \
    wget -O /usr/local/share/lets-encrypt-x1-cross-signed.pem https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.pem && \
    apk del git && \
    rm -rf /var/cache/apk/* && \
    adduser -u 500 -H -D letsencrypt && \
    mkdir /acme-dir /data && \
    chown letsencrypt:letsencrypt /acme-dir /data

ADD crt-manage /usr/local/bin/crt-manage

VOLUME ["/acme-dir", "/data"]
USER letsencrypt
ENTRYPOINT ["/usr/local/bin/crt-manage"]
