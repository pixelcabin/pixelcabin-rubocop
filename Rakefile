require 'bundler/gem_tasks'
require 'bump'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'pixelcabin/rubocop/version'
require 'rake'

namespace :release do
  desc 'release a patch upgrade to gem fury'
  task :patch do
    Rake::Task['release:bump'].invoke('patch')
    Rake::Task['release:push'].invoke
  end

  desc 'release a minor version upgrade to gem fury'
  task :minor do
    Rake::Task['release:bump'].invoke('minor')
    Rake::Task['release:push'].invoke
  end

  desc 'release a major version upgrade to gem fury'
  task :major do
    Rake::Task['release:bump'].invoke('major')
    Rake::Task['release:push'].invoke
  end

  desc 'bump version'
  task :bump, [:type] do |_, args|
    Bump::Bump.run(args[:type], commit: true, bundle: false, tag: true)
  end

  desc 'push current gem version to gem fury'
  task :push do
    current = Bump::Bump.current
    gem_name = "pixelcabin-rubocop-#{current}.gem"
    system "gem build pixelcabin-rubocop.gemspec"
    system "mkdir -p .releases"
    system "fury push #{gem_name} --as=pixelcabin"
    system "mv #{gem_name} ./.releases/"
  end
end
