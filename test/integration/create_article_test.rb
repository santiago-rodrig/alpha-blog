require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    post(
      login_url,
      params: {
        credentials: {
          email: users(:one).email,
          password: 'idontknow'
        }
      }
    )
  end

  test 'it creates an article with valid data' do
    assert_difference 'Article.count' do
      post(
        articles_url,
        params: {
          article: {
            title: 'The truth at last!',
            description: 'Bla bla bla lorem ipsum...',
            category_ids: [
              categories(:one).id,
              categories(:two).id
            ]
          }
        }
      )
    end
    assert_redirected_to article_url(Article.last)
    follow_redirect!
    assert_select(
      'div.alert.alert-success',
      match: /article.*successfully.*created/i
    )
  end

  test 'it does not create an article with invalid data' do
    assert_no_difference 'Article.count' do
      post(
        articles_url,
        params: {
          article: {
            title: 'Th',
            description: '',
            category_ids: [
              categories(:one).id,
              categories(:two).id
            ]
          }
        }
      )
    end
    assert_select 'div.alert.alert-danger', match: /errors.*article/i
    assert_select 'div.field_with_errors'
  end
end

