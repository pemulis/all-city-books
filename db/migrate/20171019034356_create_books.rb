class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :sellersku
      t.string :asin
      t.string :binding
      t.string :itemname
      t.string :listingid
      t.decimal :price, precision: 19, scale: 2
      t.integer :quantity
      t.datetime :opendate
      t.integer :productidtype
      t.string :itemnote
      t.integer :itemcondition
      t.boolean :willshipinternationally
      t.boolean :expeditedshipping
      t.string :productid
      t.integer :pendingquantity
      t.string :fulfillmentchannel
      t.string :merchantshippinggroup
      t.decimal :standardpricepoint, precision: 19, scale: 2
      t.string :producttaxcode
      t.string :source

      t.timestamps
    end
  end
end
