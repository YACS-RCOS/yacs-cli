module Yacs
  module Cli
    class Printer
      class << self
        def print items, fields
          items.each do |item|
            puts fields.map { |f| item[f] }.join("\t")
          end
        end
      end
    end
  end
end