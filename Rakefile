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
    Bump.replace_in_default = ['README.md']
    Bump.changelog = true
    Rake::Task['release:generate_commit_message'].invoke
    Bump::Bump.run(args[:type], commit: true, bundle: true, tag: false, commit_message: "\n\n#{ENV['COMMIT_MESSAGE']}")
    Rake::Task['release:tag'].invoke(ENV['COMMIT_MESSAGE'])
  end

  desc 'generate commit message'
  task :generate_commit_message do
    read = false
    lines = []
    IO.readlines('CHANGELOG.md').each do |line|
      if read
        break if line =~ /^\n/

        lines.push line
      end
      read = true if line =~ /\#\# Unreleased/
    end

    ENV['COMMIT_MESSAGE'] = lines.join('')
  end

  desc 'tag release'
  task :tag, [:message] do |_, args|
    system('git', 'tag', '-s', '-m', "v#{Bump::Bump.current}", '-m', args[:message], "v#{Bump::Bump.current}")
  end

  desc 'push gem to gem fury'
  task :push do
    current = Bump::Bump.current
    gem_name = "pixelcabin-rubocop-#{current}.gem"
    system 'gem build pixelcabin-rubocop.gemspec'
    system "fury push #{gem_name} --as=pixelcabin"
    system 'mkdir -p .releases'
    system "mv #{gem_name} ./.releases/"
    system('git', 'push', 'origin', 'master', '--tags')
  end
end
