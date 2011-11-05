$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'open-uri'
require 'rubygems'
require 'hpricot'
require 'awesome_print'

require 'allocine/allocine_base'
require 'allocine/movie'
require 'allocine/movie_list'
require 'allocine/search'
require 'allocine/version'
