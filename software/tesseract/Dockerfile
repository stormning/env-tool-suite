FROM slyak/common
COPY tesseract-3.05.zip /
COPY chi_sim.traineddata /usr/local/share/tessdata/
COPY eng.traineddata /usr/local/share/tessdata/

RUN set -x \
        && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        curl \
        git \
        libcairo2-dev \
        libicu-dev \
        libleptonica-dev \
        libpango1.0-dev \
        libpng12-dev \
        libtiff5-dev \
        libtool \
        zlib1g-dev \
        && unzip /tesseract-3.05.zip \
        && rm /tesseract-3.05.zip \
        && cd /tesseract-3.05 \
        && ./autogen.sh \
        && ./configure \
        && make \
        && make install \
        && make training \
        && make training-install \
        && ldconfig \
        && apt-get clean \
        && rm -rf /tesseract-3.05 /var/lib/apt/lists/*

VOLUME ["/usr/local/share/tessdata/"]
