FROM storm:1.1.1

COPY repositories /etc/apk/repositories
COPY pip.conf /root/.pip/pip.conf

RUN apk add --no-cache --update py-pip py-numpy; \
    pip install npTDMS; \
    pip install avro
