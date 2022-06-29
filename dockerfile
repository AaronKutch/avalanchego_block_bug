FROM fedora:36

COPY --from=avaplatform/avalanchego:v1.7.14-rc.0 /avalanchego/ /avalanchego/
RUN mv /avalanchego/build/avalanchego /usr/bin/avalanchego
