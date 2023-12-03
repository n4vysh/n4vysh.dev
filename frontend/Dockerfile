FROM node:21.2.0-alpine3.17 AS build-env

WORKDIR /home/node/
COPY --chown=node:node package.json ./
COPY --chown=node:node pnpm-lock.yaml ./
RUN corepack enable pnpm && corepack prepare --activate
USER node
RUN NODE_ENV=production pnpm install --frozen-lockfile
COPY --chown=node:node app/ app/
COPY --chown=node:node public/ public/
COPY --chown=node:node next* .
COPY --chown=node:node tsconfig.json .
COPY --chown=node:node .eslintrc.json .

RUN pnpm build

FROM nginx:1.25.3-alpine-slim

ARG S6_OVERLAY_VERSION=3.1.4.1

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk --no-cache add dockerize@testing tor gettext

RUN mkdir -p /var/lib/tor/ && \
  chmod 755 /var/lib/tor/ && \
  chown -R tor:root /var/lib/tor/ && \
  mkdir -p /home/tor/.tor/ /var/lib/tor/website/ && \
  chmod 700 /home/tor/.tor/ /var/lib/tor/website/ && \
  chown -R tor:nogroup /home/tor/.tor/ /var/lib/tor/website/

RUN touch /var/run/nginx.pid && \
  mkdir /var/lib/nginx/ && \
  chown -R nginx:nginx \
  /var/cache/nginx \
  /var/lib/nginx \
  /var/log/nginx \
  /etc/nginx/conf.d \
  /var/run/nginx.pid && \
  addgroup nginx tty && \
  sed -i -e '/^user  nginx;$/d' /etc/nginx/nginx.conf

COPY ./etc/services.d /etc/services.d
COPY ./torrc /etc/tor/torrc
COPY --chown=nginx:nginx ./nginx.tmpl.conf /etc/nginx/default.tmpl.conf
COPY --from=build-env /home/node/out /var/www/out
COPY ./scripts/init.sh /init.sh

ENTRYPOINT ["/init.sh"]
