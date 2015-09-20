class CreateAmandaCmsEntryTypes < ActiveRecord::Migration
  def change
    create_table :amanda_cms_entry_group do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
