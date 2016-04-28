class AddColumnToBuysModel < ActiveRecord::Migration
  def change
    add_column :buys, :buyer, :string
  end
end
