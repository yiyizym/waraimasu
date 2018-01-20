require 'test_helper'

class JokesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get jokes_list_url
    assert_response :success
  end

  test "should get index" do
    get jokes_index_url
    assert_response :success
  end

  test "should get share" do
    get jokes_share_url
    assert_response :success
  end

  test "should get like" do
    get jokes_like_url
    assert_response :success
  end

end
