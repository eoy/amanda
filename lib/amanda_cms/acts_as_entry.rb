module AmandaCms
  module ActsAsEntry
    extend ActiveSupport::Concern

    included do
      def set_entry_type(entry)
      # TODO: Fix this to work properly
      #
      # entry.repeater.entry_type = self.class
      # entry.repeater.save
        return true
      end

    end

    module ClassMethods
      def acts_as_entry(options = {})
        has_one :parent, through: :repeater, class_name: "AmandaCms::Entry", source: "source_entry"
        has_one :repeater, class_name: "AmandaCms::Repeater", foreign_key: "entry_id"
        has_many :repeaters, class_name: "AmandaCms::Repeater", source: :entry, foreign_key: "entry_id"
        has_many :entries, -> { distinct }, class_name: "AmandaCms::Entry", through: :repeaters, source: :source_entry, after_add: :set_entry_type

        scope :published, -> { where('published_at <= ?', Time.zone.now) }

        scope :without_parents, -> { includes(:repeaters).where(amanda_cms_repeaters: {id: nil}) }
        scope :with_children, -> { joins(:entries) }

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
  end

  module LocalInstanceMethods
    # Nothing here
  end
end

ActiveRecord::Base.send :include, AmandaCms::ActsAsEntry
