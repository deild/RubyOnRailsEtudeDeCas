#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"

ActiveRecord::Schema.define do
  
  
  create_table :catalog_entries, :force => true do |t|
    t.column :name, :string
    t.column :acquired_at, :datetime
    t.column :resource_id, :integer
    t.column :resource_type, :string
  end
  
  
  
  create_table :articles, :force => true do |t|
    t.column :content, :text
  end
  
  create_table :sounds, :force => true do |t|
    t.column :content, :binary
  end
  
  create_table :images, :force => true do |t|
    t.column :content, :binary
  end
  
  
end


class CatalogEntry < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
end



class Article < ActiveRecord::Base
  has_one :catalog_entry, :as => :resource
end

class Sound < ActiveRecord::Base
  has_one :catalog_entry, :as => :resource
end

class Image < ActiveRecord::Base
  has_one :catalog_entry, :as => :resource
end


case ARGV.shift
when "1"
  
  a = Article.new(:content => "This is my new article")
  c = CatalogEntry.new(:name => 'Article One', :acquired_at => Time.now)
  c.resource = a
  c.save!
  
  
  article = Article.find(1)
  p article.catalog_entry.name  #=> "Article One"
  
  cat = CatalogEntry.find(1)
  resource = cat.resource 
  p resource                    #=> #<Article:0x640d80 @attributes={"id"=>"1", 
                                #     "content"=>"This is my new article"}>
  

when "2"
  
  c = CatalogEntry.new(:name => 'Article One', :acquired_at => Time.now)
  c.resource = Article.new(:content => "This is my new article")
  c.save!

  c = CatalogEntry.new(:name => 'Image One', :acquired_at => Time.now)
  c.resource = Image.new(:content => "some binary data")
  c.save!

  c = CatalogEntry.new(:name => 'Sound One', :acquired_at => Time.now)
  c.resource = Sound.new(:content => "more binary data")
  c.save!

  
  
  CatalogEntry.find(:all).each do |c|
    puts "#{c.name}:  #{c.resource.class}"
  end
  
else
a = Sound.new(:content => "ding!")
c = CatalogEntry.new(:name => 'Sound One', :acquired_at => Time.now)
c.resource = a

c.save!

c = CatalogEntry.find 2
p c.resource

a = Article.find :first
p a.catalog_entry
end
