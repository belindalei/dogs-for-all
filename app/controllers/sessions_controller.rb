class SessionsController < ApplicationController


  def new 
    if !logged_in?
      render :new
    else
      redirect_to owner_path(current_owner)  
    end
  end


  def create 
      @owner = Owner.find_by(username: params[:username])
      # @owner.try(:authenticate, params[:password])
      if @owner && @owner.authenticate(params[:password])
        session[:owner_id] = @owner.id 
        redirect_to owner_path(@owner)
      else 
        @error = ""
        render :new  
      end
  end

  def destroy 
      session.delete(:owner_id)
      redirect_to root_path
  end

end