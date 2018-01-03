rails new app -d mysql
cd app
rake db:create
rake db:migrate
rake db:test:prepare
vi Gemfile
bundle
bundle binstubs rspec-core
rails g rspec:install
bin/rspec


