require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_profile" do
    get relationships_follow_profile_url
    assert_response :success
  end

  test "should get unfollow_profile" do
    get relationships_unfollow_profile_url
    assert_response :success
  end

end
