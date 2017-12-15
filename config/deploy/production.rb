set :rails_env, 'production'
set :deploy_to, '/var/www/events'
server 'sakura23', user: fetch(:user), roles: %w{app db web}
