class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end
  
  def show 
    @owner = Owner.find(params[:id])
    @adoptions = @owner.adoptions
    @pets = @owner.pets
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.valid?
      @owner.save
      session[:owner_id] = @owner.id 
      redirect_to owner_path(@owner)
    else
      flash.now[:messages] = @owner.errors.full_messages
      render :new
    end
  end
  
  def destroy 
    current_owner
    session.delete(:owner_id) 
    @owner.destroy
    @owner.adoptions.destroy_all
    redirect_to root_path
  end
  
  def owner_params
    params.require(:owner).permit(:name, :password, :username)
  end


end
