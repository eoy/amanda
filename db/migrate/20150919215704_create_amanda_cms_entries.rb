class CreateAmandaCmsEntries < ActiveRecord::Migration
  def change
    create_table :amanda_cms_entries do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true
      t.jsonb :payload, null: false, default: '{}'
      t.integer :user_id, index: true
      t.string :author_name

      t.datetime :published_at
      t.timestamps null: false
    end

    add_index :amanda_cms_entries, :payload, using: :gin
  end
end
