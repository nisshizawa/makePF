require "test_helper"

class User::HensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_hens_new_url
    assert_response :success
  end

  test "should get index" do
    get user_hens_index_url
    assert_response :success
  end

  test "should get show" do
    get user_hens_show_url
    assert_response :success
  end
end
