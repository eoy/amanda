require 'json'

module AmandaCms
  class EntryGroup < ActiveRecord::Base

    #attr_accessor :fields

    def define_entry_type(class_name=self.title, fields=self.fields)
      # Programatically define a new class based on the title
      klass = Class.new(AmandaCms::Entry) do
        acts_as_entry
      end

      # Initialize the new class for Rails
      Object.const_set(class_name.classify, klass)
      k = klass.new

      # Loop through the fields json attribute and define methods on the class
      fields.each do |field|
        klass.content_attr(field.keys.first.to_s, field.values.first.to_s)
      end

      AmandaCms.configuration.entry_types << self.title.classify
    end
  end
end
