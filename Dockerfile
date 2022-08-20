FROM ruby:2.6.6
ENV RAILS_ENV=production
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn chromium-driver
RUN mkdir /gakusyu-kun
WORKDIR /gakusyu-kun
COPY Gemfile /gakusyu-kun/Gemfile
COPY Gemfile.lock /gakusyu-kun/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /gakusyu-kun

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]