class ReviewsController < ApplicationController
    def index
        #@pet_food = PetFood.find_by(id: params[:pet_food_id])
        @reviews = Review.all
    end

    def new
        #@pet_food = PetFood.find_by(id: params[:pet_food_id])
        if @pet_food = PetFood.find_by(id: params[:pet_food_id])
            @review = @pet_food.reviews.build
        else
            redirect_to pet_foods_path
        end 
       end

    def create 
        @pet_food = PetFood.find_by(id: params[:pet_food_id])
        @review = Review.new(review_params)
        @review.pet_food_id =  params[:pet_food_id]
        if @review.save
            redirect_to review_path(@review)
        else
            flash.now[:error] = @review.errors.full_messages
            render :new
        end
    end

    def show
        #@pet_food = PetFood.find_by(id: params[:pet_food_id])
        #@review = PetFood.find_by(id: params[:id])
        @review = Review.find_by(id: params[:id])

    end

    private

    def review_params
        params.require(:review).permit(:title, :content, user_id, :pet_food_id)
    end

end

