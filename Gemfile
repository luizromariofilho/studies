source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'faraday'
gem 'oj'

# format logs and reduce default logs
gem 'lograge'
gem 'logstash-event'

# sidekiq
gem 'sidekiq', '~> 5.0'
gem 'sinatra', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bullet'
  gem 'cpf_faker'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'mailcatcher'
  gem 'parallel_tests'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-json_expectations'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubycritic', require: false
  gem 'shoulda-matchers'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
