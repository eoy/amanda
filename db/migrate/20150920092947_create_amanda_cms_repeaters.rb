class CreateAmandaCmsRepeaters < ActiveRecord::Migration
  def change
    create_table :amanda_cms_repeaters do |t|
      t.string :title
      t.integer :source_entry_id, index: true
      t.integer :entry_id, index: true
      t.string :entry_type, index: true
      t.timestamps null: false
    end

    change_table :amanda_cms_entries do |t|
      t.integer :parent_id, index: true
    end
  end
end
