FROM docker:dind

ENV USERMAP_UID 1000

RUN set -x \
    && adduser --disabled-password --gecos "" --uid ${USERMAP_UID} testrunner

USER ${USERMAP_UID}    

ENTRYPOINT []
COPY run.sh /bin/run
CMD /bin/run
