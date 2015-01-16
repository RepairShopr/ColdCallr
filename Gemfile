source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.1.4'
gem 'faker'
gem 'devise'
gem 'will_paginate', '~> 3.0.5'
gem 'faraday'
gem 'active_model_serializers'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate', '~> 2.6.5'
end
