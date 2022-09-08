class RemoveUserId < ActiveRecord::Migration[7.0]
  def change
  remove_column :posts, :user_id, :bigint
  remove_column :likes, :user_id, :bigint
  remove_column :comments, :user_id, :bigint
  end
end
