class AddAuthorizationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authorization_token, :string
  end
end
