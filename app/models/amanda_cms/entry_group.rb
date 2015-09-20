module AmandaCms
  class EntryGroup < ActiveRecord::Base
    def define_entry_type(class_name=self.title)
      klass = Object.const_set(class_name.classify, Class.new(AmandaCms::Entry))
    end
  end
end
