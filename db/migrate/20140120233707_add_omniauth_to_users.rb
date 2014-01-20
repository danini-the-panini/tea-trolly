class AddOmniauthToUsers < ActiveRecord::Migration
  def up
  	change_table(:users) do |t|
  	  t.string :provider
      t.string :uid
  	end
  end
end
