source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0.0.beta2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Setting Arel to specific version that works with ActiveRecord 4.2.0.beta4
gem 'arel', '6.0.0.beta2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Adding Devise for user authentication
gem 'devise'

# Adding Paperclip to handle document uploads
gem 'paperclip'

#Adding CanCanCan for user authorisation
gem 'cancancan', '~> 1.10'

#Adding Figaro for app security configuration
gem 'figaro'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0.beta4'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Rspec testing framework and Capybara acceptance test framework
  gem 'rspec-rails'
  gem 'capybara'

  # Guard for Rspec to automatically run tests when files are modified
  gem 'guard-rspec', require: false

  #Shoulda to help test association
  gem 'shoulda'

end
