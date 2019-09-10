class SessionsController < ApplicationController

  def new 

  end


  def create 
      @owner = Owner.find_by(username: params[:username])
      @owner.try(:authenticate, params[:password])
      if @owner 
        session[:owner_id] = @owner.id 
        redirect_to owner_path(@owner)
      else 
        @error = ""
        render :new  
      end
  end

  def destroy 
      session.delete(:owner_id)
      redirect_to login_path
  end

end