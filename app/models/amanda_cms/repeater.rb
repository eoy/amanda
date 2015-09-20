module AmandaCms
  class Repeater < ActiveRecord::Base
    belongs_to :entry
    has_one :parent, class_name: "AmandaCms::Entry", foreign_key: :id
    has_many :entries
  end
end
