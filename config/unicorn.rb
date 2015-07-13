environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'staging'

if environment == 'staging'
  root = '/apps/dd/current'
  listen '10.5.3.203:8001'
else
  root = '/apps/tmp/demo_deployment'
  listen '10.5.3.204:9001'
end

working_directory root

pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

worker_processes 4
timeout 180



preload_app true
before_fork do |server, worker|
  # Close all open connections
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
  #@resque_pid ||= spawn("bundle exec rake resque:work QUEUES=fast")
end


after_fork do |server, worker|
  # Reopen all connections
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
