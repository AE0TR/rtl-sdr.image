FROM debian:buster-slim as base

RUN apt update

FROM base as dev

RUN apt install -y git gcc cmake make

FROM dev as build

WORKDIR /var/build

RUN apt install -y libusb-1.0-0-dev; \
    git clone https://github.com/rtlsdrblog/rtl-sdr-blog.git; \
    cd rtl-sdr-blog; \
    mkdir build; \
    cd build; \
    cmake .. -DINSTALL_UDEV_RULES=ON; \
    make; \
    make install; \
    cp ../rtl-sdr.rules /etc/udev/rules.d/; \
    ldconfig; \
    tar czvf /var/build/librtlsdr.tgz /usr/local/lib

FROM base

COPY --from=build /var/build/librtlsdr.tgz .
COPY --from=build /usr/local/bin/rtl* /usr/local/bin/

RUN apt install -y libusb-1.0-0; \
    tar xzvf librtlsdr.tgz; \
    ldconfig; \
    rm *.tgz