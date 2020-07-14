class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 25 }
end