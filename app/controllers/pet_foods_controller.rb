class PetFoodsController < ApplicationController
    def index
        #binding.irb
        @pet_food = PetFood.all
    end

    def new
        @pet_food = PetFood.new
    end

    def create 
        user = current_user
        @pet_food = user.pet_foods.build(pet_params)
        #binding.irb
        if @pet_food.save
        redirect_to pet_foods_path
        else
            render :new 
      end 
    end

    def show
        @pet_food = PetFood.find(params[:id]) 
    end 

    private

    def pet_params
        params.require(:pet_food).permit(:name)
    end

end
