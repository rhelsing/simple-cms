class AlterUsers < ActiveRecord::Migration
  def up# change reverts methods.. sometimes
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit=>25, :after => "email")#after doesn't work on all dbs
  	change_column("admin_users", "email", :string, :limit=>100)
  	rename_column("admin_users", "password", "hashed_password")
  	puts "*** Adding index ***"
  	add_index("admin_users", "username")#makes lookup faster if looking up this field
  end

  def down
  	remove_index("admin_users", "username")#makes lookup faster if looking up this field
  	rename_column("admin_users", "hashed_password", "password")
  	change_column("admin_users", "email", :string, :default => "", :null => false)
  	remove_column("admin_users", "username")
  	rename_table("admin_users", "users")
  end
end
