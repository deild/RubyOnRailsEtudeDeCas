#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---

class UploadController < ApplicationController
  def get
    @picture = Picture.new
  end
  # . . .



  def save
    @picture = Picture.new(params[:picture])
    if @picture.save
      redirect_to(:action => 'show', :id => @picture.id)
    else
      render(:action => :get)
    end
  end



  def show
    @picture = Picture.find(params[:id])
  end



  def picture
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
              :filename => @picture.name,
              :type => @picture.content_type,
              :disposition => "inline")
  end


end

