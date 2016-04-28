class AddColumnToBuyModel < ActiveRecord::Migration
  def change
    add_column :buys, :buyer_name, :string
  end
end
