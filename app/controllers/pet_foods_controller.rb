class PetFoodsController < ApplicationController

    
    def index
        @pet_food = PetFood.alpha
    end

    def new
        @pet_food = PetFood.new
    end



    def create 
        user = current_user
        @pet_food = user.pet_foods.build(pet_params)
        if @pet_food.save
        redirect_to pet_foods_path(@pet_food)
        else
            render :new 
        end
    end

    def edit
        if !@pet_food || @pet_food.user != current_user
            @pet_food = PetFood.find_by_id(params[:id])
        end
    end
    
    def update 
        redirect_to pet_foods_path if !@pet_food || @pet_food.user != current_user
       if @pet_food.update
         redirect_to pet_food_path(@pet_food)
       else
         render :edit
       end
    end

    def show
        @pet_food = PetFood.find_by_id(params[:id]) 
    end 

    private

    def pet_params
        params.require(:pet_food).permit(:name, :description)
    end

end
