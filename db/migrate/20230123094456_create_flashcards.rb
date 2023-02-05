class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :category
      t.text :question
      t.text :answer
      t.text :description
      t.string :user_id

      t.timestamps
    end
  end
end
