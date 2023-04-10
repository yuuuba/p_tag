class Tag < ApplicationRecord
  # 保存される直前に実行される
  before_save :downcase_tag_name

  has_many :article_tag_relations, dependent: :destroy
  has_many :articles, through: :article_tag_relations

  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 50 }
  
  private

  # タグ名を小文字に変換
  def downcase_tag_name
    self.tag_name.downcase!
  end
end
