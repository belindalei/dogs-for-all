require 'test_helper'

class CatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cat_index_url
    assert_response :success
  end

  test "should get show" do
    get cat_show_url
    assert_response :success
  end

  test "should get new" do
    get cat_new_url
    assert_response :success
  end

end
