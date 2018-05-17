# deploys to DCE sandbox
set :stage, :travis
set :rails_env, 'production'
set :deploy_to, '/opt/kickme'
server 'nurax.curationexperts.com', user: 'deploy', roles: [:web, :app, :db, :resque_pool]
set :ssh_options, keys: ['config/kickme-travis']

