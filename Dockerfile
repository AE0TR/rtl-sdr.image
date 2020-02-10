FROM alpine:latest as build

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

RUN tar -czvf rtlsdr.tgz /usr/local

FROM alpine:latest

WORKDIR /

COPY --from=archive /var/build/rtlsdr.tgz .

RUN apk add --no-cache libusb; \
    tar -xzvf rtlsdr.tgz; \
    ldconfig; \
    rm *.tgz
    
