require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should get index" do
    get articles_path

    assert_response :success

    assert_select "title", "Cms"
  end
end
