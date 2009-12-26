begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ordinalize"
    gem.summary = %Q{Generates long winded string versions of numbers, ordinalized}
    gem.description = %Q{Generates long winded string versions of numbers, ordinalized}
    gem.email = "radarlistener@gmail.com"
    gem.homepage = "http://github.com/radar/ordinalize"
    gem.authors = ["Ryan Bigg"]
    gem.add_development_dependency "rspec"
    gem.add_dependency "humanize"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end


begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  require 'spec'
end

require 'spec/rake/spectask'
desc 'Default: run unit tests.'
task :default => :test

desc "Run the specs under spec"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.libs = %w(lib spec)
  t.spec_opts << "-c"
  t.ruby_opts << "-rubygems"
end

task :bump => ["version:bump", :gemspec]

namespace :version do
  task :read do
    unless defined? GEM_VERSION
      GEM_VERSION = File.read("VERSION")
    end
  end
  
  task :bump => :read do
    if ENV['VERSION']
      GEM_VERSION.replace ENV['VERSION']
    else
      GEM_VERSION.sub!(/\d+$/) { |num| num.to_i + 1 }
    end
    
    File.open("VERSION", 'w') { |v| v.write GEM_VERSION }
  end
end

task :release => :bump do
  system %(git add VERSION *.gemspec && git commit -m "release v#{GEM_VERSION}")
  system %(git tag -am "release v#{GEM_VERSION}" v#{GEM_VERSION})
end
