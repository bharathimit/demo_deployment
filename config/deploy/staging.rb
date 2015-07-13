# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '10.5.3.203', user: 'ror', roles: %w{app db web}#, my_property: :my_value
#server '10.5.3.205', user: 'ror', roles: %w{app db web}
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

#role :app, %w{ror@10.5.3.203}#, my_property: :my_value
#role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
#role :db,  %w{ror@10.5.3.203}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com', user: 'user_name', roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }




namespace :assets do
  desc 'compile assets locally and upload before finalize_update'

  task :deploy do
    on roles(:web) do
      #execute 'cd /apps/cdocs/current; bundle update'
      #execute 'cd /apps/cdocs/current; bundle install'
      #execute 'cd /apps/cdocs/current; RAILS_ENV=staging bundle exec rake assets:precompile'
      #execute 'cp /apps/cdocs/current/public/assets/* /cdocs_assets/ -R'
      execute '/etc/init.d/unicorn_dd stop'
      execute '/etc/init.d/unicorn_dd start'
    end
  end
  after "deploy:published", "assets:deploy"
end