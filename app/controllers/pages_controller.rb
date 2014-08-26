class PagesController < ApplicationController
 skip_before_filter :authenticate_user!, :only => [:home, :about] 
  def home
  	if current_user
	  	@alerts = current_user.alerts
  	else
  		@alerts = []
  	end
  end

  def about
  end

end
