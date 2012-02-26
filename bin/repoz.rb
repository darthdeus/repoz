#!/usr/bin/env ruby

require 'pry'
require 'pry-nav'
require 'optparse'
$:.push File.expand_path("../../lib", __FILE__)
require 'repoz'

include Repoz

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: repoz.rb [options]"

  opts.on('--add NAME') do |name, url|
    p name
    p url
    repo = Repository.new(name: name, url: url)
    unless repo.save
      puts repo.errors.messages
      exit 1
    end
  end

  opts.on('-s' '--search NAME') do |name|
    repos = Repository.where(:name.gte => name).all
    puts repos
    repos.each(&:destroy) if options[:d]
    exit 0
  end

  opts.on('-d') do |d|
    options[:d] = true
  end

  opts.on('-l', '--list') do
    puts "Listing all repositories:"
    puts
    puts Repository.all
    exit 0
  end

end.parse!

p "!!! Forgot to exit gracefuly !!!"
