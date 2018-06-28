# deploys to http://52.13.211.11/
set :stage, :aws
set :rails_env, 'production'
set :deploy_to, '/opt/kickme'
server '52.13.211.11', user: 'deploy', roles: [:web, :app, :db, :resque_pool]

