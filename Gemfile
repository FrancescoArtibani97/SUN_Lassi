source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgres as the database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

gem 'rake', '~> 12.3', '>= 12.3.3'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#Bootstrap
gem 'bootstrap'
gem 'jquery-rails'
#gem 'jquery-ui-rails'

#Form

gem "simple_form", ">= 5.0.0"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Gems needed for testing
group :test do
	gem 'cucumber-rails', :require => false
	gem 'cucumber-rails-training-wheels'
	gem 'database_cleaner'
	gem 'capybara'
  gem 'rails-controller-testing'
	gem 'launchy'
  #testing method html
  gem 'rspec-html-matchers'
end

group :development, :test do
  #gem 'factory_girl_rails'
  gem 'rspec-rails'
end
#Gems needed for security
gem 'devise'

#Omniauth
gem 'omniauth-microsoft_graph'
gem "omniauth-oauth2", "~> 1.6"

#Calendar
gem 'fullcalendar-rails'
gem 'momentjs-rails'

#Secret Keys
gem 'dotenv-rails'

#HttpRequest
gem "httparty", "~> 0.17.0"
gem "nokogiri"

#TimePicker
gem 'jquery-timepicker-rails', '~> 1.11', '>= 1.11.10'


#refresh token
gem 'rest-client'

#Font-Awesome
#Icon classes for RoR
gem 'font-awesome-sass', '~> 5.8.1'

#composite_primary_keys
gem 'composite_primary_keys'

gem "doorkeeper", "~> 5.1"
