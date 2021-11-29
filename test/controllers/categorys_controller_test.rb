require "test_helper"

class CategorysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categorys_index_url
    assert_response :success
  end

  test "should get show" do
    get categorys_show_url
    assert_response :success
  end

  test "should get create" do
    get categorys_create_url
    assert_response :success
  end

  test "should get destroy" do
    get categorys_destroy_url
    assert_response :success
  end
end
