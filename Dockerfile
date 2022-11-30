FROM python:3.10.2-alpine

WORKDIR /app

RUN apk add openssl \
    build-base cmake musl-dev supervisor linux-headers alpine-sdk postgresql-client libpq nginx

RUN apk add gdal-dev

RUN apk add --virtual .build-deps postgresql-dev zlib-dev jpeg-dev libcurl \
    libressl-dev curl-dev

RUN apk add \
    geos proj gdal-dev binutils

RUN ln -sf /usr/lib/libgeos_c.so.1 /usr/lib/libgeos_c.so

COPY . .

RUN apk add libffi-dev
RUN pip install -r requirements.txt && \
    pip install gdal==3.4.3
