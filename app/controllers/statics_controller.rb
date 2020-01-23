class StaticsController < ApplicationController
    def home_page
        @most_reviewed_product = Product.product_with_most_reviews
        @made_in_usa = Product.made_in_usa
        @recently_added = Product.recently_added
        render :home_page
    end
end