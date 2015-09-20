module AmandaCms
  class Entry < ActiveRecord::Base
    has_one :parent, through: :repeater
    has_one :repeater, class_name: "AmandaCms::Repeater", foreign_key: "entry_id"
    has_many :repeaters, class_name: "AmandaCms::Repeater", inverse_of: :entry, foreign_key: :entry_id
    has_many :entries, through: :repeaters, after_add: :set_entry_type

    scope :published, -> { where('published_at <= ?', Time.zone.now) }

    def set_entry_type(entry)
      entry.repeater.entry_type = self.class
      entry.repeater.save
    end

    def self.define_entry_type(class_name)
      klass = Object.const_set(class_name.classify, Class.new(AmandaCms::Entry))
    end

    def self.content_attr(attr_name, attr_type = :string)
      content_attributes[attr_name] = attr_type

      define_method(attr_name) do
        self.payload ||= {}
        self.payload[attr_name.to_s]
      end

      define_method("#{attr_name}=".to_sym) do |value|
        self.payload ||= {}
        self.payload[attr_name.to_s] = value
      end
    end

    def self.content_attributes
      @content_attributes ||= {}
    end
  end
end
