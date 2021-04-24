FROM golang:alpine3.13 AS stage_build

COPY src /go/src

WORKDIR /go/src

RUN go mod init src && \
    go build hello.go

FROM scratch

COPY --from=stage_build /go/src/hello /

ENTRYPOINT [ "/hello" ]