FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  nodejs postgresql-client cron locales build-essential npm \
  libpq-dev sudo vim git curl imagemagick libzbar-dev liblzma-dev zlib1g-dev \
  ghostscript && apt-get clean && rm -rf /var/lib/apt/lists/* && gem update --system

RUN echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="pt_BR.utf8"

# Set timezone
RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN echo "America/Sao_Paulo" >  /etc/timezone

# Update CA Certificates
RUN update-ca-certificates

ENV APP_ROOT /api
RUN mkdir -p $APP_ROOT && chown $USER_NAME:$USER_NAME $APP_ROOT

# Set command execution path
WORKDIR $APP_ROOT

# Set rails env variable
ARG bundle_options_var='--without development test'

COPY /Gemfile $APP_ROOT/Gemfile
COPY /Gemfile.lock $APP_ROOT/Gemfile.lock

# Install gems
RUN bundle install

# Add a script to be executed every time the container starts.
COPY ./.docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Copy all project files to application folder inside container
COPY . $APP_ROOT
