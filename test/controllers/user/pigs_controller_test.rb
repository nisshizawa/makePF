require "test_helper"

class User::PigsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_pigs_new_url
    assert_response :success
  end

  test "should get index" do
    get user_pigs_index_url
    assert_response :success
  end

  test "should get show" do
    get user_pigs_show_url
    assert_response :success
  end
end
