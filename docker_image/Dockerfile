FROM ackee/gitlab-builder

RUN apk --update add redis
COPY redis_bigkeys.sh /opt/redis_bigkeys.sh

ENV DATABASE "5"
ENV HOST "localhost"
ENV GCP_PROJECT_ID ""

CMD ["/bin/bash", "/opt/redis_bigkeys.sh"]
