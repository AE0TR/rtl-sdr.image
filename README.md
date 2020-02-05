# rtl-sdr-blog

A docker container for running the customized rtl-sdr tools from [https://www.rtl-sdr.com/in-testing-customized-drivers-for-rtl-sdr-blog-v3-sdrs/](rtl-sdr.com). 

## Usage

`docker run -d -p 1234:1234 --privileged -v /dev/bus/usb:/dev/bus/usb --name rtl_tcp dennisdunn/rtl-sdr-blog rtl_tcp -a 0.0.0.0`
