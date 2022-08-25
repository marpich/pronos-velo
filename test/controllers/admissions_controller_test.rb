require "test_helper"

class AdmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admissions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admissions_destroy_url
    assert_response :success
  end
end
