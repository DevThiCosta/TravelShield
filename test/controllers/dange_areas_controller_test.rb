require "test_helper"

class DangeAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dange_areas_index_url
    assert_response :success
  end
end
