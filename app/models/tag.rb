class Tag < ApplicationRecord
  has_many :article_tag_relations, dependent: :destroy
  has_many :articles, through: :article_tag_relations
end
