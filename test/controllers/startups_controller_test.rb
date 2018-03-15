require 'test_helper'

class StartupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get startups_index_url
    assert_response :success
  end

  test "should get show" do
    get startups_show_url
    assert_response :success
  end

  test "should get edit" do
    get startups_edit_url
    assert_response :success
  end

end
