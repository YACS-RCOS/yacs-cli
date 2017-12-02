require "httparty"

module Yacs
  class Client
    include HTTParty

    base_uri 'yacs.cs.rpi.edu/api/v5'

    def courses query
      JSON.parse(self.class.get '/courses', { query: query })['courses']
    end
  end
end