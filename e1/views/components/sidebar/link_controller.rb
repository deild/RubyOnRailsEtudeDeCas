#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

class Sidebar::LinkController < ActionController::Base

  uses_component_template_root


     Link = Struct.new(:name, :url)

     def self.find(*ignored)
       [ Link.new("pragdave", "http://blogs.pragprog.com/pragdave"),
         Link.new("automation", "http://pragmaticautomation.com")
       ]
     end


  def get_links
    @links = self.class.find(:all)
    render(:layout => false)
  end

end

