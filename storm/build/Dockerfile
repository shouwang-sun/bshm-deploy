######################################
#     THE FIRST STAGE -- BUILDER     #
######################################
FROM storm:1.1.1 as builder

COPY repositories /etc/apk/repositories
COPY pip.conf /root/.pip/pip.conf
COPY requirements.txt .
COPY lein /usr/local/bin/

RUN apk add --no-cache --update \
    build-base musl-dev libffi-dev openssl-dev python-dev py-pip
RUN pip install --no-cache-dir --no-compile --requirement requirements.txt
RUN chmod a+x /usr/local/bin/lein

######################################
#         THE SECOND STAGE           #
######################################
FROM storm:1.1.1
# install lein
ENV LEIN_ROOT 1
ADD leiningen-2.8.1-standalone.jar /root/.lein/self-installs/
COPY --from=builder /usr/local/bin/lein /usr/local/bin/

# copy python site packages
COPY --from=builder /usr/lib/python2.7/site-packages/ /usr/lib/python2.7/site-packages/
COPY --from=builder /usr/bin/streamparse* /usr/bin/sparse /usr/bin/fab /usr/bin/chardetect /usr/bin/
