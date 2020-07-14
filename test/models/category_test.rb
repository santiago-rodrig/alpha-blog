require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'category should be valid' do
    category = Category.new(name: 'sports')
    assert category.valid?
  end

  test 'name should be present' do
    category = Category.new(name: '')
    assert category.invalid?
  end

  test 'name should be unique' do
    category1 = Category.create(name: 'sports')
    category2 = Category.new(name: 'sports')
    assert category2.invalid?
  end

  test 'name should not be too long' do
    category = Category.new(name: 'a' * 26)
    assert category.invalid?
  end

  test 'name should not be too short' do
    category = Category.new(name: 'aa')
    assert category.invalid?
  end
end
