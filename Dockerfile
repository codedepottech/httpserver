FROM golang:1.11-alpine3.7

RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee 

