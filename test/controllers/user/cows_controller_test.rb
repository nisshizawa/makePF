require "test_helper"

class User::CowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_cows_new_url
    assert_response :success
  end

  test "should get index" do
    get user_cows_index_url
    assert_response :success
  end

  test "should get show" do
    get user_cows_show_url
    assert_response :success
  end
end
