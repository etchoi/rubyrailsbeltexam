class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.string :product
      t.decimal :amount
      t.references :user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
