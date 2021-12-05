FROM golang:bullseye as build
RUN go install github.com/LazarenkoA/1C2GIT@latest

FROM albus/baseimage:nightly as production
COPY --from=build /go/bin/1C2GIT /usr/local/bin/

ENTRYPOINT ["/sbin/my_init","--","/usr/local/bin/1C2GIT"]
CMD ["--help"]
