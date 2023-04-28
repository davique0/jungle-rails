require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
     
    end     

    it 'should save succesfully with all four fields filled' do
      expect(@user.save).to be true
    end

    it 'should not save if password field is empty' do
      @user.password = nil
      expect(@user.save).to be false
    end

    it 'should not save if password_confirmation field is empty' do
      @user.password_confirmation = nil
      expect(@user.save).to be false
    end

    it 'should not save if first_name field is empty' do
      @user.first_name = nil
      expect(@user.save).to be false
    end

    it 'should not save if password and password_confirmation dont match' do
      @user.password_confirmation = '987654321'
      expect(@user.save).to be false
    end

    it 'should not save if the email is already in the database' do
      @user.save
      @user2 = User.new(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
      expect(@user2.save).to be false
    end

    it 'should not save if the email is already in the database being case sensitive' do
      @user.save
      @user2 = User.new(first_name: 'John', last_name: 'Doe', email: 'TEST@test.com', password: '12345678', password_confirmation: '12345678')
      expect(@user2.save).to be false
    end

    it 'should not save if password length is less than 8 characters' do
      @user.password = '1234567'
      expect(@user.save).to be false
    end

  end
end
