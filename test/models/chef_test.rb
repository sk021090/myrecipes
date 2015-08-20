require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
   def setup
      @chef = Chef.new(chefname: "john", email: "john@example.com")
   end
  
    test "chefname should be valid" do
     assert @chef.valid?
    end 
    
    test "chefname should be present" do
      @chef.chefname = " "
      assert_not @chef.valid?
    end 
    
    test "chefname length should be not too long" do
      @chef.chefname = "a" * 21
      assert_not @chef.valid?
    end
    
    test "chefname length should be not too short" do
      @chef.chefname = "aa"
      assert_not @chef.valid?
    end
    
    test "email must be present" do
     @chef.email = ""
     assert_not @chef.valid? 
    end

    test "email length should be within bound" do
      @chef.email = "a" * 30 + "@example.com"
      assert_not @chef.valid?
    end

    test "email address should unique" do
     dup_chef = @chef.dup
     dup_chef.email = @chef.email.upcase
     @chef.save
     assert_not dup_chef.valid?
    end

    test "email address should  be valid" do
     valid_addresses = %w[user@eee.com R_TDD-ds@eee.hello.org user@example.com]
     valid_addresses.each do |va|
     @chef.email = va 
     assert @chef.valid?,'#{va.inspect} should be valid'
    end
end     
 test "email address should reject  invalid address" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
    @chef.email = ia 
    assert_not @chef.valid?,'#{ia.inspect} should be invalid'
    end 
  end 
end

