require 'test_helper'

class ImportsFileControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get imports_file_import_url
    assert_response :success
  end

end
