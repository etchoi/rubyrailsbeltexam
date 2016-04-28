class AddColumnToSellModel < ActiveRecord::Migration
  def change
    add_column :sells, :seller_name, :string
  end
end
