class AddAuthenticationTokentoUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token, unique: true

    User.find_each do |user|
      puts "generate user #{user.id} token"
      user.generate_authentication_token
      user.save!
    end
  end
end
