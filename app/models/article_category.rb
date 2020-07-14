class ArticleCategory < ApplicationRecord
  self.table_name = 'articles_categories'
  belongs_to :article
  belongs_to :category
end

