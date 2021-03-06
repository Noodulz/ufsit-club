FROM jekyll/jekyll:latest as build

WORKDIR /srv/jekyll

ADD . /srv/jekyll
#COPY Gemfile* /srv/jekyll

RUN RUN chown -R jekyll build/ && \
    gem install bundler && \
    rm -rf Gemfile.lock && \
    chmod -R 777 . && \
    bundle update && \
    bundle install
    # jekyll build && \
    # jekyll serve --livereload --drafts --trace

ARG build_command
ENV BUILD_COMMAND ${build_command}

CMD ${BUILD_COMMAND}

# EXPOSE 4000
