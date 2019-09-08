class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end
  
  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)
    redirect_to owners_path
  end

  def owner_params
    params.require(:owner).permit(:name)
  end

end
