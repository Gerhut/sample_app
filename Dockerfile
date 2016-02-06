FROM base/archlinux

RUN pacman --sync --refresh --noconfirm archlinux-keyring && \
    pacman --sync --sysupgrade --noconfirm && \
    pacman-db-upgrade && \
    pacman --sync --noconfirm gcc make git nodejs ruby postgresql && \
    pacman --sync --clean --noconfirm
RUN gem update && gem install bundle && gem cleanup

RUN mkdir /sample_app
WORKDIR /sample_app

ADD . .

ENV PATH ${PATH}:/sample_app/bin

RUN ruby ./bin/bundle install
