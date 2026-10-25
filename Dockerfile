FROM rust:trixie AS builder
WORKDIR /usr/src/workflow-playground
COPY . .
RUN echo "$(git status)"
RUN echo "$(git describe --tags)"
RUN cargo install --path .

FROM debian:trixie-slim
COPY --from=builder /usr/local/cargo/bin/workflow-playground /usr/local/bin/workflow-playground

CMD ["workflow-playground"]
