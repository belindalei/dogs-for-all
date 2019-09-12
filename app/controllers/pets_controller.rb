class PetsController < ApplicationController 
    def index 
        # byebug
        # @pets = Pet.all
        @ownership_arr = ["No Owner", "Has Owner"]
        @pets = Pet.filter(params["owners"])
        current_owner
        # byebug
    end

    def show
        @pet = Pet.find(params[:id])
        @adoptions = @pet.adoptions
        @owners = @pet.owners
    end

    def new
        @pet = Pet.new
        @ages = ["Old", "Adult", "Young", "Baby"]
        @species = ["Cat", "Dog"]
    end

    def create
        @pet = Pet.new(pet_params)

        if @pet.valid?
            @pet.save
            redirect_to pet_path(@pet)
        else
            @ages = ["Old", "Adult", "Young", "Baby"]
            @species = ["Cat", "Dog"]
            flash.now[:messages] = @pet.errors.full_messages
            render :new
        end
    end

    def cat
        @cats = identify_pet_type('Cat')
        current_owner
    end

    def dog
        @dogs = identify_pet_type('Dog')
        current_owner
    end

    private 

    def pet_params
        params.require(:pet).permit(:species, :name, :breed, :gender, :age, :img_url)
    end
    
end
