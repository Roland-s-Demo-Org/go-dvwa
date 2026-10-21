FROM golang:1.27.3@sha256:957861185dbf29d93668ace41e011d091c6e779953d47f0316ef2cc58e28fe2b AS build
WORKDIR /app
COPY . .
RUN make dvwa

FROM debian:stable-slim@sha256:a717a33469731894e77e912ea7d714e27c2dc38ee6554fd1a3102e92999cfc66
RUN mkdir -p /app
COPY --from=build /app/dvwa /app/
COPY --from=build /app/template /app/template
CMD /app/dvwa