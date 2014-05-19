class AddAncestryToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :ancestry, :string
     add_index :discussions, :ancestry
  end
end
