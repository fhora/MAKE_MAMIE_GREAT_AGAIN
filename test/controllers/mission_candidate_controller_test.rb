require "test_helper"

class MissionCandidateControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mission_candidate_new_url
    assert_response :success
  end

  test "should get create" do
    get mission_candidate_create_url
    assert_response :success
  end

  test "should get update" do
    get mission_candidate_update_url
    assert_response :success
  end

  test "should get edit" do
    get mission_candidate_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get mission_candidate_destroy_url
    assert_response :success
  end
end
