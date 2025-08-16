FROM ruby:3.1-alpine

LABEL Organization="Rml" Author="dr0n1 <dr0n6666x@gmail.com>"

RUN apk add --no-cache build-base git

WORKDIR /app

RUN git clone https://github.com/GTFOBins/GTFOBins.github.io.git .

RUN gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/ \
    && bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems

RUN echo "gem 'webrick', '~> 1.8'" >> Gemfile \
    && bundle install --jobs=4 --retry=3

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
