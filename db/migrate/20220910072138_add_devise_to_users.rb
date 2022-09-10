class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Database authentication
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recover
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Remember date
      t.datetime :remember_created_at

      ## Confirmation
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email 
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end

  def self.down

    raise ActiveRecord::IrreversibleMigration
  end
end
