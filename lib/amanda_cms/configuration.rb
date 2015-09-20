module AmandaCms
  class Configuration
    attr_accessor :entry_types

    def initialize
      @entry_types = [].freeze
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end