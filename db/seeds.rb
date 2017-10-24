# ruby encoding: utf-8
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'books_10_23_2017_4_46pm.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'utf-8')
csv.each do |row|
  asin = row['asin1']
  b = Book.find_or_initialize_by(asin: asin)
  b.update_attributes(
    :sellersku => row['seller-sku'],
    :binding => row['binding'],
    :itemname => row['item-name'],
    :listingid => row['listing-id'],
    :price => row['price'],
    :quantity => row['quantity'],
    :opendate => row['open-date'],
    :productidtype => row['product-id-type'],
    :itemnote => row['item-note'],
    :itemcondition => row['item-condition'],
    :willshipinternationally => row['will-ship-internationally'],
    :expeditedshipping => row['expedited-shipping'],
    :productid => row['product-id'],
    :pendingquantity => row['pending-quantity'],
    :fulfillmentchannel => row['fulfillment-channel'],
    :merchantshippinggroup => row['merchant-shipping-group'],
    :standardpricepoint => row['standard-price-point'],
    :producttaxcode => row['ProductTaxCode'],
    :source => row['source']
  )
end

# A test to see if this is creating and saving Book objects
# puts book = Book.first.itemname

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
