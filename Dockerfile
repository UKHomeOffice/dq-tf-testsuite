FROM docker:dind

ENTRYPOINT []
COPY run.sh /bin/run
CMD /bin/run