class AdoptionsController < ApplicationController
  def index

  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def new
    @adoption = Adoption.new
    @owners = Owner.all
    @dogs = Dog.all
    @cats = Cat.all
  end

  def create
    @adoption = Adoption.new(adopt_params)

    if @adoption.valid?
      @adoption.save
      redirect_to adoption_path(@adoption)
    else
      @owners = Owner.all
      @dogs = Dog.all
      @cats = Cat.all
      flash.now[:messages] = @adoption.errors.full_messages
      render :new
    end

  end

  def edit
    @adoption = Adoption.find(params[:id])
    @owners = Owner.all
    @dogs = Dog.all
    @cats = Cat.all
  end

  def update
    @adoption = Adoption.find(params[:id])

    if @adoption.update(adopt_params)
      redirect_to adoption_path(@adoption)
    else
      flash.now[:messages] = @adoption.errors.full_messages
      render :edit
    end
  end

  private
  def adopt_params
    params.require(:adoption).permit(:owner_id, :dog_id, :cat_id)
  end
end
