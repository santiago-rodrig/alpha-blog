class Category < ApplicationRecord
  has_many :articles_categories, class_name: 'ArticleCategory',
    dependent: :destroy
  has_many :articles, through: :articles_categories
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 25 }
end

