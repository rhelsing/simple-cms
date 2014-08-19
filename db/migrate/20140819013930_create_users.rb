class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	#rails automatically includes id unless after :users, {:id => false}
    	t.column "first_name", :string, :limit => 25 #long format
    	t.string "last_name", :limit => 50 #binary, boolean, date, datetime, decimal, float, integer, string, etc
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      t.timestamps # includes created_at and updated_at
    end
  end

  def down
  	drop_table :users
  end
end
