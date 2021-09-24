FROM golang:1.17 as hello-go

WORKDIR /go/src/app
COPY app.go .

RUN go mod init
#RUN export GOROOT=/go/src/app
RUN go build

FROM scratch

COPY --from=hello-go /go/src/app/app .

CMD ["./app"]