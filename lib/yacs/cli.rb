require "thor"
require "yacs/cli/version"
require "yacs/cli/course"

module Yacs
  module Cli
    class Command < Thor
    
      desc "course COMMANDS", "find and browse courses"
      subcommand "course", Yacs::Cli::Course
    end
  end
end
