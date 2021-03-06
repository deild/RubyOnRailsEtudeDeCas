#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
class TaggedBuilder < ActionView::Helpers::FormBuilder
  
  #  <p>
  Description</label><br/>
  #  <%= form.text_area 'description'  %>
  #</p>
  
  
  def self.create_tagged_field(method_name)
    define_method(method_name) do |label, *args|
      @template.content_tag("p",
        @template.content_tag("label" , 
                              label.to_s.humanize, 
                              :for => "#{@object_name}_#{label}") + 
        "<br/>" +
        super)
    end
  end
  
  
  field_helpers.each do |name|
    create_tagged_field(name)
  end

end
