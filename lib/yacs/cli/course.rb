require "yacs/client"
require "yacs/cli/printer"

module Yacs::Cli
  class Course < Thor

    desc "search QUERY", "search for courses matching QUERY"

    def search query
      courses = Yacs::Client.new.courses({ search: query })
      # courses.each do |course|
        # puts "#{course['id']}\t#{course['name']}"
        Printer.print courses, %w(id name)
      # end
    end
  end
end
