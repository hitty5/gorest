# syntax=docker/dockerfile:1

# Build the application from source
FROM public.ecr.aws/docker/library/golang:latest AS build-stage

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /gorest

# Run the tests
FROM build-stage AS run-test-stage
RUN go test -v ./...

# Deploy the application binary into a lean image
FROM scratch AS build-release-stage

WORKDIR /

COPY --from=build-stage /gorest /gorest

EXPOSE 8080

ENTRYPOINT ["/gorest"]