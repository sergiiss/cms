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

  test "should get show" do
    article = Article.first

    get article_path(article)

    if article.nil?
      assert_response :missing
    else
      assert_response :success

      assert_select "div", 7
    end
  end


  test "should get new" do
    get new_article_path

    assert_response :success

    assert_select "form input", 9
  end
end
