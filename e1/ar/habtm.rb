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

class Article < ActiveRecord::Base
  has_and_belongs_to_many :users
  # ...
end

class User < ActiveRecord::Base
  has_and_belongs_to_many :articles
  # ...
end

a = Article.new
a.title = "My Article"

u = User.new
u.name = "pragdave"

#u.articles.push_with_attributes(a, :when_read => Time.now)
u.articles << a

u.save

