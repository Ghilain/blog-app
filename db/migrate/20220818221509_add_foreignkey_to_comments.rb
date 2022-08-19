class AddForeignkeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, references: :users, index: true
    add_reference :likes, :post, references: :posts, index: true
    add_reference :comments, :post, references: :posts, index: true
    add_reference :comments, :author, references: :users, index: true
    add_reference :posts, :author, references: :users, index: true
  end
end
