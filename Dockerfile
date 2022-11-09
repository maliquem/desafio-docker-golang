FROM golang:alpine AS builder

WORKDIR /src
COPY . .
RUN go build -ldflags '-s -w' fullcycle.go

FROM scratch

WORKDIR /
COPY --from=builder /src / 
CMD ["./fullcycle"]