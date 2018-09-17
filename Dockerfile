# FROM golang:1.11-alpine

# RUN apk update && apk upgrade && \
# apk add --no-cache git


# RUN go get github.com/astaxie/beego
# RUN go get github.com/beego/bee 

FROM golang:1.11 as builder
WORKDIR /go/src
RUN go get -v github.com/astaxie/beego
RUN go get -v github.com/smartystreets/goconvey/convey
ENV GOPATH="/go"
ENV PATH="${GOPATH}/src:${PATH}"
ENV PATH="${GOPATH}/bin:${PATH}"
COPY . ./
RUN ["ls"]
RUN CGO_ENABLED=0 GOOS=linux go build -a -o app .


FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /go/src
COPY --from=builder /go/src/app .
CMD ["./app"]

