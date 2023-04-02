class AddCheckboxToFlashcards < ActiveRecord::Migration[7.0]
  def change
    add_column :flashcards, :checkbox, :boolean
  end
end
