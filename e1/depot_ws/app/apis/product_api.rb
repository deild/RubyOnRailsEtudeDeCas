#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class ProductApi < ActionWebService::API::Base
  api_method :find_all_products,
             :returns => [[:int]]
  api_method :find_product_by_id,
             :expects => [:int],
             :returns => [Product]
end
