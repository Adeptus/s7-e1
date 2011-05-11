  task :default => :test

  task :test do
    FileList["tests/test_*"].each do |file|
      ruby "#{file}"
    end
  end
