FROM golang:latest
WORKDIR /go/src/github.com/mvazquezc/reverse-words/
COPY main.go .
RUN go get github.com/gorilla/mux && go get github.com/prometheus/client_golang/prometheus/promhttp
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
RUN echo "paso1"

FROM scratch
RUN echo "paso2"
COPY --from=0 /go/src/github.com/mvazquezc/reverse-words/main .
RUN echo "paso3"
EXPOSE 8080
RUN echo "paso4"
CMD ["/main"]
RUN echo "final"
