class Flashcard < ApplicationRecord
  CATEGORY_LIST = ["プログラミング", "データベース", "ネットワーク", "セキュリティ"]

  belongs_to :user

  validates :question, presence: true
  validates :answer, presence: true
end
