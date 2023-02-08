class Flashcard < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :question, presence: true
  validates :answer,presence: true
end
