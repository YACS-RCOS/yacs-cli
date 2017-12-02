require "thor"
require "yacs/cli/version"
require "yacs/cli/course"
require "yacs/client"
require "yacs/cli/printer"

module Yacs
  module Cli
    class Command < Thor
      COURSE_API_OPTIONS = %w(id name number department_code department_id search)
      SECTION_API_OPTIONS = %w(id name crn instructors course_id)
      SYSTEM_OPTIONS = %w(v q)
    
      desc "course", "find and browse courses"
      options COURSE_API_OPTIONS
      options SYSTEM_OPTIONS
      def course
        courses = Yacs::Client.new.courses(options)
        fields = %w(id)
        unless options['q']
          fields << 'name'
          fields << 'description' if options['v']
        end
        Printer.print courses, fields
      end

      desc "section", "find sections"
      options SECTION_API_OPTIONS
      options SYSTEM_OPTIONS
      def section
        sections = Yacs::Client.new.sections(options)
        fields = %w(id)
        unless options['q']
          fields.concat %w(name crn instructors seats_taken seats)
        end
        Printer.print sections, fields
      end
    end
  end
end
