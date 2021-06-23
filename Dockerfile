FROM alpine:builder as builder

WORKDIR /var/build

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
#RUN ldconfig

ENTRYPOINT ["ash"]
