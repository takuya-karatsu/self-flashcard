class Flashcard < ApplicationRecord
  validates :category, presence: true
  validates :question, presence: true
  validates :answer,presence: true
end
