# rtl-sdr-blog

A docker container for running the customized rtl-sdr tools from [https://www.rtl-sdr.com/in-testing-customized-drivers-for-rtl-sdr-blog-v3-sdrs/](rtl-sdr.com). 

## Usage

On a raspberrypi 3:

` docker run --rm --device /dev/bus/usb/001/005 dennisdunn/rtl-sdr-blog:arm rtl_test`
