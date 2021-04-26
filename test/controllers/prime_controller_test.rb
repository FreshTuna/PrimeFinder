require "test_helper"

class PrimeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prime_index_url
    assert_response :success
  end
end
