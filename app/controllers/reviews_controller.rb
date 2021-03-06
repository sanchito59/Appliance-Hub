class ReviewsController < ApplicationController
    before_action :authorize, only: [:new, :edit, :update, :destroy]

    def new
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new 
    end
    
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
        if @review.save
            flash[:notice] = "#{@product.name} has been reviewed!"
            redirect_to product_path(@product)
        else
            flash[:alert] = "Something went wrong."
            render :new
        end
    end
    
    def show
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        render :show        
    end
    
    def edit
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.find(params[:product_id])
            @review = Review.find(params[:id])
            render :edit
        end
    end
    
    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            flash[:notice] = "#{@review.author}'s review has been updated!"
            redirect_to product_path(@review.product)
        else
            flash[:alert] = "Something went wrong."
            redirect_to product_path(@review.product)
        end
    end

    def destroy
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @review = Review.find(params[:id])
            @review.destroy
            flash[:notice] = "Review successfully removed."
            redirect_to product_path(@review.product)
        end
    end
    
    private
        def review_params
            params.require(:review).permit(:author, :content_body, :rating)
        end
end