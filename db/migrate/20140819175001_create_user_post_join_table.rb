class CreateUserPostJoinTable < ActiveRecord::Migration #name doesn't matter, use generator
  def change
  	#WORKS
    create_join_table :admin_users, :pages do |t|
       t.index [:admin_user_id, :page_id]
       t.index [:page_id, :admin_user_id]
    end
  end
end
