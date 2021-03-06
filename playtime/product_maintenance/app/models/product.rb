#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url

  validates_numericality_of :price,
                            :message => "should be a number like 12.34"
  validates_uniqueness_of :title
  validates_format_of :image_url, 
                      :with    => %r{\.(gif|jpg|png)$}i,
                      :message => "must be a URL for a GIF, JPG, or PNG image"

  validates_length_of :title, :minimum => 10
                        
  protected
  
  def validate
    errors.add(:price, "should be at least 0.01") if price.nil? ||  price < 0.01
  end

end