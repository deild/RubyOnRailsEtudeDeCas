#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require "rubygems"
require_gem "activerecord"

require 'connect'

ActiveRecord::Base.logger = Logger.new(STDOUT)


class Order < ActiveRecord::Base
end

class Payment < ActiveRecord::Base
end

class Refund < ActiveRecord::Base
end


class OrderObserver < ActiveRecord::Observer
  def after_save(an_order)
    an_order.logger.info("Order #{an_order.id} created")
  end
end

OrderObserver.instance



class AuditObserver < ActiveRecord::Observer

  observe Order, Payment, Refund

  def after_save(model)
    model.logger.info("#{model.class.name} #{model.id} created")
  end
end

AuditObserver.instance



o = Order.create
p = Payment.create

