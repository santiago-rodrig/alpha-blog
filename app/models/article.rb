class Article < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :title, length: { minimum: 6, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 300 }
end

