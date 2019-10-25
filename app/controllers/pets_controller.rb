class PetsController < ApplicationController 
    def index 
        @ownership_arr = ["No Owner", "Has Owner"]
        @pets = Pet.filter(params["owners"]).sort_by{ |a| a.name }
        current_owner
    end

    def show
        @pet = Pet.find(params[:id])
        @adoptions = @pet.adoptions
        @owners = @pet.owners
        current_owner
    end

    def new
        @pet = Pet.new
        @ages = ["Old", "Adult", "Young", "Baby"]
        @species = ["Cat", "Dog"]
        current_owner
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
        @ownership_arr = ["No Owner", "Has Owner"]
        @cats = identify_pet_type('Cat')
        
        current_owner
    end

    def dog
        @ownership_arr = ["No Owner", "Has Owner"]
        @dogs = identify_pet_type('Dog')
        current_owner 
    end

    private 

    def pet_params
        params.require(:pet).permit(:species, :name, :breed, :gender, :age, :img_url)
    end
    
end
