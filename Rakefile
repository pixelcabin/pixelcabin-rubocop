# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'bump'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'pixelcabin/rubocop/version'
require 'rake'
require 'pxl_gem_deployer/rake_task'

PxlGemDeployer::RakeTask.new(:'pixelcabin-rubocop')
