class Product < ApplicationRecord
    scope :product_with_most_reviews, -> {( select("products.id, products.name, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(1) )}
    # scope :avg_rating, -> {(  )}
    # SELECT AVG(rating) FROM reviews;
    scope :made_in_usa, -> { where(country_of_origin: "United States of America") }
    scope :recently_added, -> { order(created_at: :desc).limit(3)}
    scope :a_to_z, -> { order("name ASC") }
    scope :z_to_a, -> { order("name DESC") }

    # scope :sum_of_products, -> {( select("") )}
    # scope :search, -> (search_term) { where("name like ?", "%#{search_term}%")}

    has_many :reviews, dependent: :destroy
    validates :name, :cost, :country_of_origin, presence: true

    before_save(:titleize_product)

    private
        def titleize_product
            self.name = self.name.titleize
        end
end