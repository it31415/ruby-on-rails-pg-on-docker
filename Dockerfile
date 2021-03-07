FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs=4
COPY . /app

# コンテナが起動するたびに実行されるスクリプトを設定
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# コンテナを立ち上げた時にRailsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
