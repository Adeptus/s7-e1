require 'bundler'
Bundler::GemHelper.install_tasks

  task :default => :test

  task :test do
    FileList["tests/test_*"].each do |file|
      ruby "#{file}"
    end
  end
