class AddFieldsToAmandaCmsEntryGroups < ActiveRecord::Migration
  def change
    add_column :amanda_cms_entry_groups, :fields, :jsonb, null: false, default: '{}'
  end
end
