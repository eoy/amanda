require 'json'

module AmandaCms
  class EntryGroup < ActiveRecord::Base

    attr_accessor :fields

    def define_entry_type(class_name=self.title, fields={})

      klass = Class.new(AmandaCms::Entry) do
        acts_as_entry
      end
      Object.const_set(class_name.classify, klass)

      k = klass.new

      fields.each do |field|
        klass.content_attr(field.keys.first.to_s, field.values.first.to_s)
      end

      AmandaCms.configuration.entry_types << self.title.classify
    end
  end
end
