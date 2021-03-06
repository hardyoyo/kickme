# config valid only for current version of Capistrano
###lock "3.10.2" ### disabled locking because I just need this to work already, OK?

set :application, "kickme"
set :repo_url, "https://github.com/" + ENV['PROJECT_OWNER'] + "/" + ENV['PROJECT_NAME']

# Default branch is :master
set :branch, ENV['REVISION'] || ENV['BRANCH'] || 'master'

#tmp dir 
set :tmp_dir,"/home/deploy/tmp"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/analytics.yml", "config/blacklight.yml", "config/browse_everything_providers.yml", "config/database.yml", "config/fedora.yml", "config/secrets.yml", "config/solr.yml"

# required for the versioned footer
append :linked_files, ".env.production"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
