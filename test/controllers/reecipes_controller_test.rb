require 'test_helper'

class ReecipesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
