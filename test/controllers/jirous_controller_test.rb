require 'test_helper'

class JirousControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get jirous_create_url
    assert_response :success
  end

end
