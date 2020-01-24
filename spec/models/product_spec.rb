require 'rails_helper'

describe Product do
    it { should have_many(:reviews) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :country_of_origin }
    it("titleizes the name of an product") do
        product = Product.create({name: "golden Mushroom", cost: 26, country_of_origin: "Delfino"})
        expect(product.name()).to(eq("Golden Mushroom"))
    end
end