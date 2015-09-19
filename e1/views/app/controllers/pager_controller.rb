#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class PagerController < ApplicationController

  def populate
    User.delete_all
    ["Chris Pine",
     "Chad Fowler",
     "Dave Thomas",
     "Andy Hunt",
     "Adam Keys",
     "Maik Schmidt",
     "Mike Mason",
     "Greg Wilson",
     "Jeffrey Fredrick",
     "James Gray",
     "Daniel Berger",
     "Eric Hodel",
     "Brian Marick",
     "Mike Gunderloy",
     "Ryan Davis",
     "Scott Davis",
     "David Heinemeier Hansson",
     "Scott Barron",
     "Marcel Molina",
     "Brian McCallister",
     "Mike Clark",
     "Esther Derby",
     "Johanna Rothman",
     "Juliet Thomas",
     "Thomas Fuchs"].each {|name| User.create(:name => name)}

    763.times do |i|
      User.create(:name => "ZZUser #{"%03d" % i}")
    end
  end

  
  def user_list
    @user_pages, @users = paginate(:users, :order => 'name')
  end
  

end
