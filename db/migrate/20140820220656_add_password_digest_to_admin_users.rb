class AddPasswordDigestToAdminUsers < ActiveRecord::Migration
  def up
  	add_column "admin_users", "password_digest", :string
  	remove_column "admin_users", "hashed_password"
  end
  def down
  	remove_column "admin_users", "password_digest"
  	add_column "admin_users", "hashed_password", :string
  end
end
