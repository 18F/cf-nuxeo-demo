FROM nuxeo:10.10
USER root
RUN apt-get update && apt-get install -y --no-install-recommends jq

COPY foundryish.sh /
COPY nuxeo.conf /docker-entrypoint-initnuxeo.d/nuxeo.conf

ENTRYPOINT ["/foundryish.sh"]
CMD ["nuxeoctl","console"]

USER 1000
