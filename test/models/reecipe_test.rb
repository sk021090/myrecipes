require 'test_helper'

class ReecipeTest < ActiveSupport::TestCase
  def setup
      @reecipe = Reecipe.new(name: "chicken", summary: "this is good checken", description: "do what ever u like to make ur chicken")
  end
 test "reecipe should be valid" do
     assert @reecipe.valid?
    end 
    test "name should be present" do
      @reecipe.name = " "
      assert_not @reecipe.valid?
    end 
    
    test "name length should be not too long" do
      @reecipe.name = "a" * 21
      assert_not @reecipe.valid?
    end
    
    test "name lenght should be not too short" do
      @reecipe.name = "a" * 4
      assert_not @reecipe.valid?
      
    end
    
    test "summary must be present" do
     @reecipe.summary = " "
      assert_not @reecipe.valid?
  
    end
    
    test "summary length should not be too long" do
       @reecipe.summary = "a" * 200
      assert_not @reecipe.valid?
  
    end
    
    test "summary length should not be too short" do
      @reecipe.summary = "a" * 9
      assert_not @reecipe.valid?
    end
    
    test "description must be present" do
      @reecipe.description = " "
      assert_not @reecipe.valid?
    end
    
    test "description length should not be too long" do
       @reecipe.description = "a" * 201
      assert_not @reecipe.valid?
    end
    
    test "description length should not be too short" do
       @reecipe.description = "a" * 19
      assert_not @reecipe.valid?
    end
end 