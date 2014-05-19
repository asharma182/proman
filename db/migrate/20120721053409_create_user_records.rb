class CreateUserRecords < ActiveRecord::Migration
  def change
    create_table :user_records do |t|
    	t.string :first_name,

      t.timestamps
    end
  end
end
