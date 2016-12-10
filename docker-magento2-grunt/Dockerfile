FROM php
MAINTAINER James Cowie <james@jcowie.co.uk>

RUN apt-get update && apt-get install -y \
        curl

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - \
  && apt-get install -y nodejs

RUN npm install -g grunt-cli

COPY run-grunt.sh /usr/local/bin/run-grunt.sh

WORKDIR /var/www/html

CMD ["run-grunt.sh"]
