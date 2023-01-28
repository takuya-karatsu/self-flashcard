
ActiveRecord::Schema[7.0].define(version: 2023_01_23_094456) do
  create_table "flashcards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category"
    t.text "question"
    t.text "answer"
    t.text "description"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
