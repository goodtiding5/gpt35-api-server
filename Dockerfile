FROM --platform=linux/amd64 oven/bun:slim

# fix home directory permission for user 'bun'
USER root

RUN set -ex \
&&  chown -R bun:bun /home/bun

WORKDIR /home/bun/app

COPY ./entrypoint.sh /usr/local/bin
COPY ./package.json .
COPY ./app.ts .
COPY ./bun.lockb .
COPY ./tsconfig.json .
COPY ./LICENSE .

USER bun

RUN set -ex \
&&  bun install

# Expose the port the app runs on
EXPOSE 3040

# Command to run the start script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
