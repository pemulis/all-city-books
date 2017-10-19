# ruby encoding: utf-8
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'books_09_27_2017.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'utf-8')
csv.each do |row|
  b = Book.new
  b.sellersku = row['seller-sku']
  b.asin = row['asin1']
  b.binding = row['binding']
  b.itemname = row['item-name']
  b.listingid = row['listing-id']
  b.price = row['price']
  b.quantity = row['quantity']
  b.opendate = row['open-date']
  b.productidtype = row['product-id-type']
  b.itemnote = row['item-note']
  b.itemcondition = row['item-condition']
  b.willshipinternationally = row['will-ship-internationally']
  b.expeditedshipping = row['expedited-shipping']
  b.productid = row['product-id']
  b.pendingquantity = row['pending-quantity']
  b.fulfillmentchannel = row['fulfillment-channel']
  b.merchantshippinggroup = row['merchant-shipping-group']
  b.standardpricepoint = row['standard-price-point']
  b.producttaxcode = row['ProductTaxCode']
  b.source = row['source']

  b.save
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
