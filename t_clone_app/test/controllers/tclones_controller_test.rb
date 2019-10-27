require 'test_helper'

class TclonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tclones_index_url
    assert_response :success
  end

end
