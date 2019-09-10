class PetsController < ApplicationController
    def index 
        @pets = Pet.all
    end

    def show
        @pet = Pet.find(params[:id])
        @adoptions = @pet.adoptions
        @owners = @pet.owners
    end

    def new
        @pet = Pet.new
        @ages = ["Old", "Adult", "Young", "Baby"]
    end

    def create
        @pet = Pet.new(pet_params)

        if @pet.valid?
            @pet.save
            redirect_to pet_path(@pet)
        else
            @ages = ["Old", "Adult", "Young", "Baby"]
            flash.now[:messages] = @pet.errors.full_messages
            render :new
        end
    end

    def cat
        @cats = Pet.all.select do |p|
            p.species == 'cat'
        end

        # redirect_to cat_pet_path()
    end

    private 

    def pet_params
        params.require(:pet).permit(:species, :name, :breed, :gender, :age, :img_url)
    end
    
end
