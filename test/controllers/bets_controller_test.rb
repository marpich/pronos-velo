require "test_helper"

class BetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bets_new_url
    assert_response :success
  end

  test "should get create" do
    get bets_create_url
    assert_response :success
  end

  test "should get index" do
    get bets_index_url
    assert_response :success
  end
end
