require "httparty"

module Yacs
  class Client
    include HTTParty

    base_uri 'yacs.cs.rpi.edu/api/v5'

    def courses query
      JSON.parse(self.class.get '/courses', { query: query })['courses']
    end

    def sections query
      JSON.parse(self.class.get '/sections', { query: query })['sections']
    end
  end
end