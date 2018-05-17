# deploys to DCE sandbox
set :stage, :sandbox
set :rails_env, 'production'
set :deploy_to, '/opt/kickme'
server 'kickme.curationexperts.com', user: 'deploy', roles: [:web, :app, :db, :resque_pool]

