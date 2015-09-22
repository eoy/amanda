require 'rails'

module AmandaCms
  class Railtie < Rails::Railtie
    initializer "define_entry_types" do
      # TODO: Be able to load all entry groups in the railtie
      # instead of the initializer
      #
      # AmandaCms::EntryGroup.all.each do |type|
      #   puts "#{type.title} \n"
      #   type.define_entry_type(type.title, type.fields)
      # end
    end
  end
end