FROM perl:5.20

MAINTAINER Dominic Sonntag <dominic.sonntag@unitedprint.com>

RUN cpanm YAML Dancer2 && rm -rf /root/.cpanm

RUN cpanm Dancer2::Plugin::Auth::Extensible && rm -rf /root/.cpanm

RUN cpanm LWP::Protocol::https

RUN mkdir /app

WORKDIR /app

COPY . /app/

EXPOSE 3000

CMD [ "perl", "dancer2.pl" ]

