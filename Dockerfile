FROM golang as builder
RUN mkdir /app
RUN mkdir /build
ADD . /app
WORKDIR /app
# Add this go mod download command to pull in any dependencies
RUN go mod download
# Our project will now successfully build with the necessary go libraries included.
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /build/app .
# Our start command which kicks off
# our newly created binary executable
CMD ["/build/app"]

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /build/app .
CMD ["./app"]