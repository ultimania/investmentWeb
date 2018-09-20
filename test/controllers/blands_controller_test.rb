require 'test_helper'

class BlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blands_index_url
    assert_response :success
  end

  test "should get show" do
    get blands_show_url
    assert_response :success
  end

end
