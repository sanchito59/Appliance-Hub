class ProductsController < ApplicationController
    before_action :authorize, only: [:index, :new, :create, :edit, :update, :destroy]

    # Code for listing all products
    def index
        @products = Product.all
        if params[:search]
            binding.pry
            @products = Product.search(params[:search])
        elsif params[:a_to_z]
            @products = Product.a_to_z
        elsif params[:z_to_a]
            @products = Product.z_to_a
        elsif params[:product_with_most_reviews]
            @products = Product.product_with_most_reviews
        elsif params[:made_in_usa]
            @products = Product.made_in_usa
        elsif params[:recently_added]
            @products = Product.recently_added
        end
        render :index
    end
    
    # Code for new product form
    def new
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.new
            render :new
        end
    end
    
    # Code for creating a new product
    def create
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.new(product_params)
            if @product.save
                flash[:notice] = "#{@product.name} was successfully added!"
                redirect_to products_path
            else
                render :new
            end
        end
    end
    
    # Code for edit product form
    def edit
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.find(params[:id])
            render :edit
        end
    end
    
    # Code for showing a single product
    def show
        @product = Product.find(params[:id])
        render :show
    end
    
    # Code for updating a product
    def update
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.find(params[:id])
            if @product.update(product_params)
                flash[:notice] = "#{@product.name} was successfully updated!"
                redirect_to products_path
            else
                render :edit
            end
        end
    end
    
    # Code for deleting a product
    def destroy
        if current_user.admin != true
            redirect_to '/'
            flash[:notice] = "You do not have permission to do that."
        else
            @product = Product.find(params[:id])
            @product.destroy
            flash[:notice] = "Product was successfully deleted!"
            redirect_to products_path
        end
    end

    private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
    
end