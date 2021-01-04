FROM ubuntu:latest as builder
RUN apt update && apt install --yes --no-install-recommends \
    wget
WORKDIR altosterino-site
COPY . /altosterino-site/
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.70.0/hugo_0.70.0_Linux-64bit.deb --no-check-certificate && dpkg -i hugo*.deb && hugo


FROM nginx:latest
COPY --from=builder /altosterino-site/public /usr/share/nginx/html