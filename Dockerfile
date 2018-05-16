FROM docker:dind

ENV USERMAP_UID 1000

RUN set -x \
    && adduser -D -g "" -u ${USERMAP_UID} testrunner  \
    && mkdir /bin/run \
    && chown testrunner:testrunner /bin/run \
    && chmod 700 /bin/run

USER ${USERMAP_UID}

ENTRYPOINT []
COPY run.sh /bin/run
CMD /bin/run
