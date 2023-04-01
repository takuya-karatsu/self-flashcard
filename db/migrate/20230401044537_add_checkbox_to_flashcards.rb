class AddCheckboxToFlashcards < ActiveRecord::Migration[7.0]
  def change
    remove_column :flashcards, :checkbox if column_exists?(:flashcards, :checkbox)
    add_column :flashcards, :checkbox, :boolean
  end
end
