class AddScopeToUsefultags < ActiveRecord::Migration[6.0]
  def change
    add_column :userful_tags, :scope, :string
  end
end
