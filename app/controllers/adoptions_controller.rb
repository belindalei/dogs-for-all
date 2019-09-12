class AdoptionsController < ApplicationController
  def index

  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  # Create a new cat/dog through the pets show page
  def new
    @adoption = Adoption.new
    @pet = Pet.find(params[:pet])
    current_owner
  end

  # Create a new cat through the home page
  def adopt_cat  
    @adoption = Adoption.new
    @cats = identify_pet_type('Cat')
  end
  
  # Create a new dog through the home page
  def adopt_dog 
    @adoption = Adoption.new
    @dogs = identify_pet_type('Dog')
  end

  def create
    @pet = Pet.find(params[:pet])
    @adoption = Adoption.new(pet_id: @pet.id, owner_id: current_owner.id)

    if @adoption.valid?
      @adoption.save
      redirect_to adoption_path(@adoption)
    else
      flash.now[:messages] = @adoption.errors.full_messages
      render :new
    end
  end

  def create_dog 
    @adoption = Adoption.new(adopt_params)
    @adoption.owner_id = session[:owner_id]
    if @adoption.valid?
      @adoption.save
      redirect_to adoption_path(@adoption)
    else
      @dogs = identify_pet_type('Dog')
      @error = ""
      flash.now[:messages] = @adoption.errors.full_messages
      render :adopt_dog
    end
  end

  def create_cat
    @adoption = Adoption.new(adopt_params)
    @adoption.owner_id = session[:owner_id]
    if @adoption.valid?
      @adoption.save
      redirect_to adoption_path(@adoption)
    else
      @cats = identify_pet_type('Cat')
      @error = ""
      flash.now[:messages] = @adoption.errors.full_messages
      render :adopt_cat
    end
  end

  def edit
    @adoption = Adoption.find(params[:id])
    @owners = Owner.all
    @pets = Pet.all
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

  def destroy 
    @adoption = Adoption.find(params[:id])
    @adoption.destroy
    redirect_to owner_path(@adoption.owner)
  end

  private
  def adopt_params
    params.require(:adoption).permit(:owner_id, :pet_id, :pet)
  end
end
