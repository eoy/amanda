module AmandaCms
  class Repeater < ActiveRecord::Base
    belongs_to :source_entry, class_name: "AmandaCms::Entry", foreign_key: :source_entry_id
    belongs_to :dist_entry, class_name: "AmandaCms::Entry", foreign_key: :entry_id
  end
end
