# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'audit_baltimore'
set :repo_url, 'git@github.com:smartlogic/audit_baltimore'
set :deploy_to, '/home/deploy/apps/audit_baltimore'
set :scm, :git

set :format, :pretty
set :log_level, :info

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_custom_path, '/opt/rbenv'
set :rbenv_ruby, '2.1.0'
set :rbenv_roles, :app

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke("unicorn:restart")
  end

  desc 'Setup'
  task :setup do
    invoke('deploy:check')
    invoke('monit:setup')
    invoke('nginx:setup')
    invoke('unicorn:setup')
  end

  after :updating, 'custom:rbenv_version'
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'
end
