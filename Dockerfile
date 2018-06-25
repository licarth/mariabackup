ARG version=10.3

FROM debian:jessie

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db \
    && add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.3/debian jessie main' \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq mariadb-backup-$VERSION \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT mariabackup
