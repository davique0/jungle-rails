require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Test Category')
      @product = Product.new(name: 'Test Plant', price: 25, quantity: 45, category: @category)
    end

    it 'should save successfully with all four fields filled' do
      expect(@product.save).to be true
    end

    it 'should not save without a name' do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without a price' do
      @product.price_cents = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should not save without a quantity' do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save without a category' do
      @product.category = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

# Now within that nested describe block, define one example for each validation. You should have the following validations in the Product model:

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

# Tips (read first!)
# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above
