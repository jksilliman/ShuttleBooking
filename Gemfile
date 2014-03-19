source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'sqlite3'

gem 'devise', '~> 1.4.0', :git => 'git://github.com/plataformatec/devise.git', :branch => 'v1.4'
gem "devise_ldap_authenticatable", '~> 0.5.0', :git => "git://github.com/jksilliman/devise_ldap_authenticatable.git"

gem 'jquery-rails'
gem 'cancan'
gem 'haml'
gem 'haml-rails'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git', :branch => 'wrappers'
gem 'responders'
gem "therubyracer", :require => 'v8'
gem 'bluecloth'
gem 'high_voltage'
gem 'coffee-filter'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  
  # Newer versions of sass have a bug which breaks our bootstrap css
  gem 'sass', "3.1.1"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

# gem 'unicorn'
# gem 'capistrano'
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'annotate'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
