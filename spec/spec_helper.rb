
begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
#  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'allocine'

def read_fixture(path)
  File.read(File.expand_path(File.join(File.dirname(__FILE__), "fixtures", path)))
end
