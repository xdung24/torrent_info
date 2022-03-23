FROM six8/pyinstaller-alpine:alpine-3.6-pyinstaller-v3.4 as builder
RUN mkdir /build
COPY . /build/
WORKDIR /build
RUN pyinstaller --noconfirm --onefile --clean main.py

FROM alpine as release
COPY --from=builder /build/dist/main /usr/bin/torrent-info