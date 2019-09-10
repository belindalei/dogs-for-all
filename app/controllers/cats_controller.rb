class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @adoptions = @cat.adoptions
    @owners = @cat.owners
  end

  def new
    @cat = Cat.new
    @ages = ["Old", "Adult", "Young", "Baby"]
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.valid?
      @cat.save
      redirect_to cat_path(@cat)
    else
      @ages = ["Old", "Adult", "Young", "Baby"]
      flash.now[:messages] = @cat.errors.full_messages
      render :new
    end
  end

  private 

  def cat_params
    params.require(:cat).permit(:name, :breed, :gender, :age, :img_url)
  end

end
