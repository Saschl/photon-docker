FROM sapmachine:17

# Install pbzip2 for parallel extraction
RUN apt update \
    && apt -y install \
        pbzip2 \
        wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
ADD https://github.com/komoot/photon/releases/download/0.6.2/photon-0.6.2.jar /photon/photon.jar
COPY entrypoint.sh ./entrypoint.sh

EXPOSE 2322

ENTRYPOINT /photon/entrypoint.sh
