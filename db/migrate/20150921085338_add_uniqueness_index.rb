class AddUniquenessIndex < ActiveRecord::Migration
  def change
    add_index :amanda_cms_entry_entries, :entry, unique: true
  end
end
