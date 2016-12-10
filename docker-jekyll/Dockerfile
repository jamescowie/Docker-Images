FROM ruby:2.3.1

MAINTAINER James Cowie <james@jcowie.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update                              && \
    apt-get install --no-install-recommends -qy    \
                    apache2-utils                  \
                    nginx-extras                   \
                    nodejs                         \
                    sudo                        && \
    apt-get clean                               && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD default.conf /etc/nginx/conf.d/
ADD ./entrypoint.sh /bin/

RUN mkdir /data                                 && \
    rm /etc/nginx/sites-enabled/default         && \
    chmod +x /bin/entrypoint.sh

EXPOSE "80"

ENTRYPOINT ["/bin/entrypoint.sh"]
