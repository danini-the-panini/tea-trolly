class AddAttributesToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :description, :text
    add_column :items, :price, :decimal
  end
end
