FROM perl:5.20

MAINTAINER Dominic Sonntag <dominic.sonntag@unitedprint.com>

RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN cpanm YAML Carton Starman Dancer2 && rm -rf /root/.cpanm

RUN cpanm Dancer2::Plugin::Auth::Extensible && rm -rf /root/.cpanm

RUN cpanm LWP::Protocol::https

RUN cpanm Auth::ActiveDirectory

RUN cpanm Test::Net::LDAP

RUN mkdir /app

WORKDIR /app

COPY . /app/

EXPOSE 3000

CMD [ "perl", "dancer2.pl" ]

