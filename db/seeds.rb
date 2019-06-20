require 'JSON'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



def initial_parse
  count = 1
  category_counter = 1
  while count <= 22 do
    trivia = RestClient.get("https://opentdb.com/api.php?amount=50&category=#{category_counter}")
    results = JSON.parse(trivia)['results']
    create_questions(results)
    count += 1
    category_counter += 1
  end
end

def create_questions(results)
  results.each {|result|
    create_category(result)
    new_question = Question.new
    new_question.category_id = Category.find_or_create_by(name: result[:category]).id
    new_question.prompt = result["question"]
    new_question.correct_answer = result["correct_answer"]
    new_question.incorrect_answers = result["incorrect_answers"]
    new_question.save
  }
end

def create_category(result)
  Category.find_or_create_by(name: result["category"])
end

def remove_quote

  Question.all.each {|question|
    @prompt = question.prompt.gsub(/&quot;/,'"')
    @prompt2 = question.prompt.gsub(/&#039;/,"'")
    question.update(prompt: @prompt)
    question.update(prompt: @prompt2)

    @correct_answer = question.correct_answer.gsub(/&quot;/,'"')
    @correct_answer2 = question.correct_answer.gsub(/&#039;/,"'")
    question.update(correct_answer: @correct_answer )
    question.update(correct_answer: @correct_answer2 )


    @incorrect_answers = question.incorrect_answers.gsub(/&quot;/,'"')
    @incorrect_answers2 = question.incorrect_answers.gsub(/&#039;/,"'")
    question.update(incorrect_answers: @incorrect_answers)
    question.update(incorrect_answers: @incorrect_answers2)

  }
end

# JSON.parse(data.replace(/&quot;/g,'"'));
# initial_parse
# remove_quote

c1 = Category.create(name: "Bible Trivia")
Category.create(name: "More Bible Trivia")
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 2, prompt: "What is the last book of the New Testament?", correct_answer: "Revelations", incorrect_answers: ["Genesis", "Leviticus", "Numbers"])
