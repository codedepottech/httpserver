# FROM golang:1.11-alpine

# RUN apk update && apk upgrade && \
# apk add --no-cache git


# RUN go get github.com/astaxie/beego
# RUN go get github.com/beego/bee 

FROM golang:1.11 as builder
WORKDIR /go/src/
RUN go get -d -v golang.org/x/net/html
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/app .
CMD ["./app"]

