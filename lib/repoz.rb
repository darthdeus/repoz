$:.push File.expand_path(__FILE__)
require "repoz/version"
require 'mongo_mapper'

module Repoz

  # if ENV['MONGOHQ_URL']
  #   MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10072)
  #   MongoMapper.database = 'repoz'
  #   MongoMapper.database.authenticate('repos', ENV['REPOZ_PASSWORD'])
  # else
  ::MongoMapper.database = 'repoz_development'
  # end


  class Repository
    include ::MongoMapper::Document

    key :name, String
    key :url, String

    validates_presence_of :name
    validates_presence_of :url

    def to_s
      self.name.ljust(10) + self.url
    end
  end
  # Your code goes here...
end
