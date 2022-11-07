require "test_helper"

class User::ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_managements_new_url
    assert_response :success
  end

  test "should get show" do
    get user_managements_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_managements_edit_url
    assert_response :success
  end

  test "should get index" do
    get user_managements_index_url
    assert_response :success
  end
end
