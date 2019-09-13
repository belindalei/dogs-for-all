class ApplicationController < ActionController::Base
  
  helper_method :current_owner


  def current_owner
    if session[:owner_id]
      @owner = Owner.find(session[:owner_id])
    end
  end 

  def logged_in?
    !!current_owner
  end

  def authorized
    redirect_to login_path unless logged_in?
  end


  #helper method
  def identify_pet_type(species)
    @pets = Pet.filter(params["owners"]).sort_by{ |a| a.name }
    @pets.select do |p|
      p.species == species
    end
  end 

end
