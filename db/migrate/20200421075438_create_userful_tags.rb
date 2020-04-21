class CreateUserfulTags < ActiveRecord::Migration[6.0]
  def change
    create_table :userful_tags do |t|
      t.string     :name, null: false
      t.string     :tag_name, null: false
      t.references :record, null: false, polymorphic: true, index: false

      t.timestamps

      t.index [ :record_type, :record_id, :name, :tag_name ], name: "index_useful_tags_uniqueness", unique: true
    end
  end
end
