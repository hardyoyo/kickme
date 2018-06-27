# deploys to http://ec2-54-189-34-94.us-west-2.compute.amazonaws.com
set :stage, :aws
set :rails_env, 'production'
set :deploy_to, '/opt/kickme'
server 'kickme.thebignow.com', user: 'deploy', roles: [:web, :app, :db, :resque_pool]

