FROM docker.io/solanalabs/rust

RUN sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"

WORKDIR /usr/src

COPY init /usr/src/init

WORKDIR /usr/src/init

ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

RUN cargo build-sbf

RUN rm -rf /usr/src/init

VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD cargo build-sbf