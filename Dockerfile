FROM golang:alpine as build
RUN apk fix
RUN apk --update add git git-lfs
RUN go install github.com/LazarenkoA/1C2GIT@latest

FROM alpine as production
COPY --from=build /go/bin/1C2GIT /
ENTRYPOINT ["/1C2GIT"]
CMD ["--help"]
