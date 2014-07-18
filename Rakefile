#!/usr/bin/env rake
require 'rake'
require 'rspec/core/rake_task'

cfg_dir = File.expand_path File.dirname(__FILE__)
ENV['BERKSHELF_PATH'] = cfg_dir + '/.berkshelf'
cook_dir = cfg_dir + '/.cooks'

task :default => 'test:quick'
namespace :test do

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir.glob('test/spec/**/*_spec.rb')
    t.rspec_opts = "--color -f d --fail-fast"
    system "rm -rf  #{cook_dir}"
    system "berks vendor #{cook_dir}"
  end

  begin
    require 'kitchen/rake_tasks'
    Kitchen::RakeTasks.new
  rescue
    puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
  end

  begin
    require 'foodcritic/rake_task'
    require 'foodcritic'
    task :default => [:foodcritic]
    FoodCritic::Rake::LintTask.new do |t|
      t.options = {:fail_tags => %w/correctness services libraries deprecated/ }
    end
  rescue LoadError
    warn "Foodcritic Is missing ZOMG"
  end

  begin
    require 'rubocop/rake_task'
    Rubocop::RakeTask.new do |task|
      task.fail_on_error = true
      task.options = %w{-D -a}
    end
  rescue LoadError
    warn "Rubocop gem not installed, now the code will look like crap!"
  end

  desc 'Run all of the quick tests.'
  task :quick do
    Rake::Task['test:rubocop'].invoke
    Rake::Task['test:foodcritic'].invoke
    Rake::Task['test:spec'].invoke
  end

  desc 'Run _all_ the tests. Go get a coffee.'
  task :complete do
    Rake::Task['test:quick'].invoke
    Rake::Task['test:kitchen:all'].invoke
  end

  desc 'Run CI tests'
  task :ci do
    Rake::Task['test:complete'].invoke
  end
end

namespace :release do
  task :update_metadata do
  end

  task :tag_release do
  end
end

