FROM alekzonder/puppeteer:1

# @see http://label-schema.org/rc1/
LABEL org.label-schema.vendor="UKWA" \
  org.label-schema.name="ukwa-pa11y" \
  org.label-schema.description="Docker image for pa11y, the CLI-based accessibility testing tool." \
  org.label-schema.usage="https://github.com/min2ha/docker-pa11y/blob/master/README.md" \
  org.label-schema.vcs-url="https://github.com/min2ha/docker-pa11y" \
  org.label-schema.docker.cmd="docker run -it --rm --cap-add=SYS_ADMIN min2ha/docker-pa11y http://example.com" \
  org.label-schema.docker.cmd.help="docker run --rm min2ha/docker-pa11y" \
  org.label-schema.docker.debug="docker exec -it $CONTAINER bash" \
  org.label-schema.schema-version="latest" \
  org.label-schema.version="1.0"

USER root

# Let's get pa11y v5 in here. Also adds http-server for running pa11y against staticly-generated HTML.
RUN yarn global add pa11y@5 pa11y-ci@2 netcat curl http-server

USER pptruser

ENTRYPOINT ["dumb-init", "--"]
