require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "valid?" do
    article = Article.new(title: "Foo", h1: "Foo", description: "Foo", slug: "foo", menu_label: "foo", published_at: "2017-12-03 10:10:00", content: "<h1>Foo</h1>", priority: 2)
    # raise article.errors.full_messages.inspect
    assert article.valid?
  end

  test "russian input for friendly id" do
    article = Article.new(title: "Foo", h1: "Foo", description: "Foo", slug: "foo", menu_label: "foo", published_at: "2017-12-03 10:10:00", content: "<h1>Foo</h1>", priority: 2)

    foo = article.normalize_friendly_id("кошка")

    assert foo == "koshka"
  end

  test "english input for friendly id" do
    article = Article.new(title: "Foo", h1: "Foo", description: "Foo", slug: "foo", menu_label: "foo", published_at: "2017-12-03 10:10:00", content: "<h1>Foo</h1>", priority: 2)

    foo = article.normalize_friendly_id("cat")

    assert foo == "cat"
  end
end
