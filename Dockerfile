FROM alpine:3.12.7 AS builder

WORKDIR /var/build

RUN apk add --update --no-cache \
vim \
curl \
git \
linux-headers \
musl-dev \
libusb-dev \
build-base \
make \
cmake 

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog.git; \
    cd rtl-sdr-blog; \
    mkdir build; \
    cd build; \
    cmake .. -DINSTALL_UDEV_RULES=ON; \
    make; \
    make install; 

FROM alpine:3.12.7

WORKDIR /

COPY --from=builder /usr/local/bin/ /usr/local/bin 
COPY --from=builder /usr/local/lib/ /usr/local/lib 

RUN apk add --no-cache libusb

# Use the default entrypoint

