class ReviewsController < ApplicationController


    def index
        if @pet_food = PetFood.find_by(id: params[:pet_food_id])
            @reviews = @pet_food.reviews
        else
        @reviews = Review.all
     end
    end

    def new
        if @pet_food = PetFood.find_by(id: params[:pet_food_id])
            @review = @pet_food.reviews.build
        else
            @review = Review.new
        end 
       end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            flash.now[:error] = @review.errors.full_messages
            render :new
        end
    end

    def Edit
    end 

    def update
    end 

    def show
        @review = Review.find_by(id: params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :user_id, :pet_food_id)
    end
    
    def set_review
        @review = Review.find_by(id: params[:id])
    end 
end

