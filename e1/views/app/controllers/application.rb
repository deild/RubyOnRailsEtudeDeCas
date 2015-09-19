#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

require "rdoc_template"

ActionView::Base.register_template_handler("rdoc", RDocTemplate)


require "eval_template"
ActionView::Base.register_template_handler("reval", EvalTemplate)


class ApplicationController < ActionController::Base
end
