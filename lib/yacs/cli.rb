require "thor"
require "yacs/cli/version"
require "yacs/cli/course"
require "yacs/client"
require "yacs/cli/printer"

module Yacs
  module Cli
    class Command < Thor
      COURSE_API_OPTIONS = %w(id name number department_code department_id search)
      SYSTEM_OPTIONS = %w(v q)
    
      desc "course", "find and browse courses"
      COURSE_API_OPTIONS.each { |o| option o }
      SYSTEM_OPTIONS.each { |o| option o}

      def course
        courses = Yacs::Client.new.courses(options)
        fields = %w(id)
        unless options['q']
          fields << 'name'
          fields << 'description' if options['v']
        end
        Printer.print courses, fields
      end
    end
  end
end
