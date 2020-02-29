FROM python:3.6-alpine

LABEL Organization="CTFHUB" Author="Virink <virink@outlook.com>"

COPY _files /tmp/
# COPY src /app

# Default Env
ENV WORK_CLASS=gevent MODULE_NAME=app VARIABLE_NAME=app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk update; \
    # _files
    mv /tmp/flag.sh /flag.sh; \
    mv /tmp/pip.conf /etc/pip.conf; \
    # pip && build-deps
    apk add --no-cache --virtual .build-deps gcc libc-dev linux-headers; \
    python -m pip install -U pip; \
    python -m pip install -U gunicorn[gevent,eventlet]; \
    apk del --no-network .build-deps; \
    # docker-entrypoint
    mv /tmp/docker-entrypoint /usr/local/bin/docker-entrypoint \
    && chmod +x /usr/local/bin/docker-entrypoint; \
    # workdir
    chown -R nobody:nogroup /app

WORKDIR /app

EXPOSE 80

CMD ["docker-entrypoint"]
