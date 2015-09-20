module AmandaCms
  class Configuration
    attr_accessor :entry_types

    def initialize
      @entry_types = [].freeze
      AmandaCms::EntryGroup.all.each do |type|
        type.define_entry_type
      end
    end

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end