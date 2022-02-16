FROM google/cloud-sdk

RUN apt-get update && \
    apt-get install -y jq redis-tools && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY redis_bigkeys.sh /opt/redis_bigkeys.sh

ENV DATABASE "5"
ENV HOST "localhost"
ENV GCP_PROJECT_ID ""

CMD ["/bin/bash", "/opt/redis_bigkeys.sh"]
