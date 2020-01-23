class ReviewsController < ApplicationController
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
            render :new
        end
    end
    
    def show
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        render :show        
    end
    
    def edit
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        render :edit
    end
    
    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
          flash[:notice] = "#{@review.author}'s review has been updated!"
          redirect_to product_path(@review.product)
        else
          render :edit
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        flash[:notice] = "Review successfully removed."
        redirect_to product_path(@review.product)
    end
    
    private
        def review_params
            params.require(:review).permit(:author, :content_body, :rating)
        end
end