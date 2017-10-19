require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { asin: @book.asin, binding: @book.binding, expeditedshipping: @book.expeditedshipping, fulfillmentchannel: @book.fulfillmentchannel, itemcondition: @book.itemcondition, itemname: @book.itemname, itemnote: @book.itemnote, listingid: @book.listingid, merchantshippinggroup: @book.merchantshippinggroup, opendate: @book.opendate, pendingquantity: @book.pendingquantity, price: @book.price, productid: @book.productid, productidtype: @book.productidtype, producttaxcode: @book.producttaxcode, quantity: @book.quantity, sellersku: @book.sellersku, source: @book.source, standardpricepoint: @book.standardpricepoint, willshipinternationally: @book.willshipinternationally } }, as: :json
    end

    assert_response 201
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { asin: @book.asin, binding: @book.binding, expeditedshipping: @book.expeditedshipping, fulfillmentchannel: @book.fulfillmentchannel, itemcondition: @book.itemcondition, itemname: @book.itemname, itemnote: @book.itemnote, listingid: @book.listingid, merchantshippinggroup: @book.merchantshippinggroup, opendate: @book.opendate, pendingquantity: @book.pendingquantity, price: @book.price, productid: @book.productid, productidtype: @book.productidtype, producttaxcode: @book.producttaxcode, quantity: @book.quantity, sellersku: @book.sellersku, source: @book.source, standardpricepoint: @book.standardpricepoint, willshipinternationally: @book.willshipinternationally } }, as: :json
    assert_response 200
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book), as: :json
    end

    assert_response 204
  end
end
