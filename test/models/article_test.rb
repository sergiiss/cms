require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: "Foo", h1: "Foo", description: "Foo", slug: "foo", menu_label: "foo", published_at: "2017-12-03 10:10:00", content: "<h1>Foo</h1>", priority: 2)
  end

  test "valid?" do
    # raise article.errors.full_messages.inspect
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 41
    assert_not @article.valid?
  end

  test "title should be unique" do
    duplicate_article = @article.dup
    @article.save

    assert_not duplicate_article.valid?
  end

  test "russian input for friendly id" do
    foo = @article.normalize_friendly_id("кошка")

    assert foo == "koshka"
  end

  test "english input for friendly id" do
    foo = @article.normalize_friendly_id("cat")

    assert foo == "cat"
  end
end
