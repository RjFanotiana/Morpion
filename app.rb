
8 lines (6 sloc) 176 Bytes
require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/application'

#launching Application.new will start a new game
Application.new

