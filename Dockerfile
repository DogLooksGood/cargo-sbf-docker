FROM docker.io/library/rust:1.75

RUN sh -c "$(curl -sSfL https://release.anza.xyz/v2.0.3/install)"

WORKDIR /usr/src

COPY init /usr/src/init

WORKDIR /usr/src/init

ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

RUN cargo build-sbf

RUN rm -rf /usr/src/init

VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD cargo build-sbf
