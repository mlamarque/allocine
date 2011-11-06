$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'open-uri'
require 'rubygems'
require 'awesome_print'

require 'allocine_parser/allocine_base'
require 'allocine_parser/movie'
require 'allocine_parser/movie_list'
require 'allocine_parser/search'
require 'allocine_parser/version'
require 'allocine_parser/serie'
require 'allocine_parser/season'
require 'allocine_parser/episode'
