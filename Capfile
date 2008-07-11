load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
Dir['lib/recipes/*.rb'].each { |recipe| load(recipe) }
load 'config/deploy'

namespace :ultrasphinx do
  desc <<-DESC
    Runs ultrasphinx rake tasks. By default will configure then index.
  DESC
  task :default do
    configure
    index
    deploy:restart
  end
  
  desc <<-DESC
    Run the ultrasphinx configure task. By default, it runs this in most recently \
    deployed version of the app. The defaults are

      set :rake,           "rake"
      set :rails_env,      "staging"
      set :migrate_target, :latest
  DESC
  task :configure do
    rake = fetch(:rake, "rake")
    rails_env = fetch(:rails_env, "staging")
    ultrasphinx_target = fetch(:ultrasphinx_target, :latest)

    directory = case ultrasphinx_target.to_sym
      when :current then current_path
      when :latest  then current_release
      else raise ArgumentError, "unknown release target #{ultrasphinx_target.inspect}"
      end

    run "cd #{directory}; #{rake} RAILS_ENV=#{rails_env} ultrasphinx:configure"
  end

  desc <<-DESC
    Run the ultrasphinx index task. By default, it runs this in most recently \
    deployed version of the app. The defaults are

      set :rake,           "rake"
      set :rails_env,      "staging"
      set :migrate_target, :latest
  DESC
  task :index do
    rake = fetch(:rake, "rake")
    rails_env = fetch(:rails_env, "staging")
    ultrasphinx_target = fetch(:ultrasphinx_target, :latest)

    directory = case ultrasphinx_target.to_sym
      when :current then current_path
      when :latest  then current_release
      else raise ArgumentError, "unknown release target #{ultrasphinx_target.inspect}"
      end

    run "cd #{directory}; #{rake} RAILS_ENV=#{rails_env} ultrasphinx:index"
  end
end