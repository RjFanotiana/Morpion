require 'bundler'
Bundler.require
require_relative  'lib/Application'
system("clear")
Application.new.perform
