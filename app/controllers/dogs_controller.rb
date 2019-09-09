class DogsController < ApplicationController
  def index 
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @adoptions = @dog.adoptions
    @owners = @dog.owners
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.valid?
      @dog.save
      redirect_to dog_path(@dog)
    else
      flash.now[:messages] = @dog.errors.full_messages
      render :new
    end
  end

  private 

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :img_url)
  end

end
