server 'vagrant', :user => "deploy", :roles => %w{web app db}, :primary => true

set :stage, :staging
set :rails_env, :staging
