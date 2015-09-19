#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
module TestHelper
  def show(xml, str)
    res = eval(str)
    xml.dt(:newline => "yes") do
      xml.inlinecode("<%= " + str + " %>")
    end
    xml.dd do
      xml.p(res)
    end
  end
  
end
