class Article < ApplicationRecord
  belongs_to :user
  has_many :articles_categories, class_name: 'ArticleCategory',
    dependent: :destroy
  has_many :categories, through: :articles_categories
  validates :title, :description, presence: true
  validates :title, length: { minimum: 6, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 300 }
end

