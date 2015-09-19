#START:original
require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  
  #START:fixtures
  fixtures :products
  #END:fixtures
  
  def test_truth
    assert true
  end
#END:original

  #START:test_empty_attributes
  def test_invalid_with_empty_attributes
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end
  #END:test_empty_attributes

  #START:test_positive_price
  def test_positive_price
    product = Product.new(:title       => "My Book Title",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    product.price = -1
    assert !product.valid?
    assert_equal "doit être au moins 0.01", product.errors.on(:price)

    product.price = 0
    assert !product.valid?
    assert_equal "doit être au moins 0.01", product.errors.on(:price)

    product.price = 1
    assert product.valid?
  end
  #END:test_positive_price

  #START:test_image_url
  def test_image_url
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      product = Product.new(:title       => "My Book Title",
                            :description => "yyy",
                            :price       => 1,
                            :image_url   => name)
      assert product.valid?, product.errors.full_messages
    end

    bad.each do |name|
      product = Product.new(:title => "My Book Title", :description => "yyy", :price => 1,
                            :image_url => name)
      assert !product.valid?, "saving #{name}"
    end
  end
  #END:test_image_url

  #START:test_unique_title
  def test_unique_title
    product = Product.new(:title       => products(:ruby_book).title,
                          :description => "yyy", 
                          :price       => 1, 
                          :image_url   => "fred.gif")

    assert !product.save
    assert_equal "has already been taken", product.errors.on(:title)
  end
  #END:test_unique_title

  #START:test_unique_title1
  def test_unique_title1
    product = Product.new(:title       => products(:ruby_book).title,
                          :description => "yyy", 
                          :price       => 1, 
                          :image_url   => "fred.gif")

    assert !product.save
    assert_equal ActiveRecord::Errors.default_error_messages[:taken],
                 product.errors.on(:title)
  end
  #END:test_unique_title1
  
#START:original
end
#END:original
