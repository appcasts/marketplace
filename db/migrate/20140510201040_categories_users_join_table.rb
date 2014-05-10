class CategoriesUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :users
  end
end
