source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.2"

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '~> 1.1.2', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem "rails-erd", '~> 1.5.0', require: false # UML generator
  gem 'annotate', '~> 2.7.1', require: false # bundle exec annotate -> makes schema and other useful comments for code
end

group :development, :test do
  gem "rspec-rails", '~> 3.6'
  gem "spring-commands-rspec", '~> 1.0.4'  #Spring for rspec ^
  # gem 'dotenv-rails', '~> 2.1.2'
  gem 'pry-rails', '~> 0.3.6' # The awesome IRB replacer
  gem 'awesome_print', '~> 1.7.0'  # rails konsoles prettyfier
end

group :test do
  gem "factory_girl_rails", '~> 4.8'
  gem "timecop", '~> 0.8.1'
  gem 'database_cleaner', '~> 1.6.1'
end
