FROM arm32v7/alpine as build

WORKDIR /var/build

RUN apk add --no-cache musl-dev gcc make cmake pkgconf git libusb-dev

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog.git; \
    cd rtl-sdr-blog; \
    mkdir build; \
    cd build; \
    cmake .. -DINSTALL_UDEV_RULES=ON; \
    make; \
    make install; 

FROM build as archive

WORKDIR /var/build

RUN tar -czvf librtlsdr.tgz /usr/local/lib

FROM arm32v7/alpine

WORKDIR /

COPY --from=build /usr/local/bin/rtl* /usr/local/bin/
COPY --from=archive /var/build/librtlsdr.tgz .

RUN apk add --no-cache libusb; \
    tar -xzvf librtlsdr.tgz; \
    ldconfig; \
    rm *.tgz
    