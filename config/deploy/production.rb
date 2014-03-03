server '23.239.8.170', :user => "deploy", :roles => %w{web app}

set :stage, :production
set :rails_env, :production
