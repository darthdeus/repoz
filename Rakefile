require "bundler/gem_tasks"

$:.push File.expand_path("lib", __FILE__)
require 'repoz'

desc "Populate the db with some basic records"
task :populate do
  repositories = [
    {name: 'scvrush',   url: 'https://github.com/darthdeus/scvrush.git'},
    {name: 'repoz',     url: 'https://github.com/darthdeus/repoz.git'},
    {name: 'dotfiles',  url: 'https://github.com/darthdeus/dotfiles.git'}
  ]
  Repoz::Repository.destroy_all
  repositories.each do |repo|
    Repoz::Repository.create!(name: repo[:name], url: repo[:url])
  end
end