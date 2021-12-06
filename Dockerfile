FROM golang:bullseye as build
RUN go install github.com/LazarenkoA/1C2GIT@latest

FROM albus/baseimage:nightly as production
COPY --from=build /go/bin/1C2GIT /opt/1C2GIT/1c2git

ENTRYPOINT ["/sbin/my_init","--"]
CMD ["/opt/1C2GIT/1c2git","--help"]
