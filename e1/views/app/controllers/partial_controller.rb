#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class PartialController < ApplicationController

  def test1
    @article = "fred"
    def @article.title
      "my title"
    end
    def @article.body
      "my body"
    end
  end

    
end
