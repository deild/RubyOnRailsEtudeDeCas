#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

ActiveRecord::Schema.define do
  
  create_table :counters, :force => true do |t|
    t.column :count,        :integer
    t.column :lock_version, :integer, :default => 0
  end
  
end


require "rubygems"
require_gem "activerecord"


class Counter < ActiveRecord::Base
end

Counter.delete_all
Counter.create(:count => 0)

count1 = Counter.find(:first)
count2 = Counter.find(:first)

count1.count += 3 
count1.save
     
count2.count += 4 
count2.save

