require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test 'get category form and create category' do
    get '/categories/new'
    assert_response :success

    assert_difference 'Category.count' do
      post '/categories', params: { category: { name: 'pets' } }
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
    assert_match 'pets', response.body
  end

  test 'get category form and reject invalid category' do
    get '/categories/new'
    assert_response :success

    assert_no_difference 'Category.count' do
      post '/categories', params: { category: { name: 'pe' } }
    end

    assert_select 'div.alert.alert-danger'
    assert_match /errors.*category/i, response.body
  end
end

