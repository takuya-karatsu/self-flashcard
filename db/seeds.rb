test_user = User.find_or_create_by!(name: "test_user") do |user|
  user.email = "sample@gmail.com"
  user.password = "password"
end

Flashcard.find_or_create_by!(
  category: "プログラミング",
  question: "次の言語を動的型付け言語と静的型付け言語に分類しなさい\nRuby, Java, JavaScript, Python, Go",
  answer: "動的型付け言語：Ruby, JavaScript, Python\n静的型付け言語：Java, Go",
  description: "動的型付け言語では、プログラマが型の指定を行う必要がなく、静的型付け言語では、プログラマが型の指定を行うことが必要",
  user_id: test_user.id
)