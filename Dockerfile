FROM golang:1.20 as build-stage

WORKDIR /tmp/go

COPY . .

RUN go build -v -o helloworld .

FROM scratch
COPY --from=build-stage /tmp/go/helloworld /usr/local/bin/helloworld

CMD ["helloworld"]

