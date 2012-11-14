class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def up
  	create_table :roles_users do |t|
  		t.references :role, :user
  	end
  end

  def down
  	drop_table :roles_users
  end
end
