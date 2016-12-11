FROM drecom/ubuntu-ruby:2.2.3

RUN apt-get update                              && \
    apt-get install --no-install-recommends -qy    \
                    apache2-utils                  \
                    nginx-extras                   \
                    nodejs                         \
                    sudo                        && \
    apt-get clean                               && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ADD ./entrypoint.sh /bin/

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

ADD default.conf /etc/nginx/conf.d/
ADD ./generate-html.sh /bin/
ADD ./entrypoint.sh /bin/
RUN mkdir /data                                 && \
    rm /etc/nginx/sites-enabled/default         && \
    chmod +x /bin/generate-html.sh              && \
    chmod +x /bin/entrypoint.sh

EXPOSE "80"

ENTRYPOINT ["/bin/entrypoint.sh"]