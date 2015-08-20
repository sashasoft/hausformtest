require 'test_helper'

class KarkasdomControllerTest < ActionController::TestCase
  test "should get skaffold" do
    get :skaffold
    assert_response :success
  end

end
