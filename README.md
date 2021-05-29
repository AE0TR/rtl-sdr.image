# rtl-sdr-blog

A docker container for running the modified Osmocom drivers from [rtl-sdr.com](https://www.rtl-sdr.com/in-testing-customized-drivers-for-rtl-sdr-blog-v3-sdrs/).

## Building Multi-Platform Images

The Docker [multi-arch](https://docs.docker.com/buildx/working-with-buildx/) command `buildx` is used to build the amd64 and arm/v7 images.

* Create a Docker context for building amd64 images `docker context create node-amd64`
* Create a Docker context for building arm images `docker context create --docker host=ssh://pi@raspberrypi.local node-arm`
* Create a Docker builder `docker buildx create --use --name mutibuild node-amd64`
* Append the arm node to the builder `docker buildx create --append --name multibuild node-arm`
* Login to Docker Hub `docker login -u <repo> --password-stdin`
* Build the images `docker buildx build --platform linux/amd64,linux/arm/v7 -t <repo>/rtl-sdr --push .`
* Remove the builder `docker buildx rm multibuild`

## Usage

See [hub.docker.com/dennisdunn](https://hub.docker.com/repository/docker/dennisdunn/rtl-sdr-blog)

### Example

The example directory contains a docker-compose.yml that publishes the output of rtl_adsb to 
a mosquitto server.

