# rtl-sdr-blog

A docker container for running the modified rtl-sdr tools from [rtl-sdr.com](https://www.rtl-sdr.com/in-testing-customized-drivers-for-rtl-sdr-blog-v3-sdrs/). 

## Usage

On a raspberrypi 3:

` docker run --rm --device /dev/bus/usb/001/005 dennisdunn/rtl-sdr-blog rtl_test`

## Install Docker on RPi3
[](https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl)

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi

docker run hello-world

