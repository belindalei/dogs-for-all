class DogsController < ApplicationController
  def index 
    @dogs = Dog.all
  end

  def show  #not working...associations error
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create #creates a new dog but goes to empty path...do we even need new dogs actually since the API would just add them? 
    @dog = Dog.create(dog_params)
    redirect_to dogs_path
  end

  def edit 
    @dog = Dog.find(params[:id])
    @owners = Owner.all 
  end 

  def update 
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  private 

  def dog_params
    params.require(:dog).permit(:owner)
  end

end
