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

Category.create(name: "Bible Trivia")
Category.create(name: "More Bible Trivia")
category.create(name: "User Submitted")
Question.create(category_id: 1, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 1, prompt: "How many books are there in the standard Bible?", correct_answer: "66", incorrect_answers: ["39", "54", "72"])
Question.create(category_id: 1, prompt: "At the time of the census which was conducted by Moses in the first chapter of Numbers, which of the twelve tribes of Israel was the largest?", correct_answer: "Judah", incorrect_answers: ["Gad", "Asher", "Ruben"])
Question.create(category_id: 1, prompt: "Which of the following animals were the Israelites forbidden to eat by the Old Testament?", correct_answer: "Rabbit", incorrect_answers: ["Antelope", "Sheep", "Goat"])
Question.create(category_id: 1, prompt: "When were Israelites required to free their servants?", correct_answer: "In The 7th Year Of Their Service", incorrect_answers: ["Never", "When The Servants Produced Offsprings", "In The 12th Year Of Their Service"])
Question.create(category_id: 1, prompt: "Who climbed a sycamore tree in order to see Jesus as he entered Jericho?", correct_answer: "Zacchaues", incorrect_answers: ["Nebuchadnezzar", "Nicodemus", "Zerrubbabel"])
Question.create(category_id: 1, prompt: "Who was chosen to replace Judas as the twelfth apostle?", correct_answer: "Matthias", incorrect_answers: ["Paul", "Andrew", "Bartholomew"])
Question.create(category_id: 1, prompt: "Who did Peter raise from the dead in Joppa?", correct_answer: "Dorcas", incorrect_answers: ["Lazarus", "Ananias", "Martha"])
Question.create(category_id: 1, prompt: "Who built the first city?", correct_answer: "Cain", incorrect_answers: ["Enoch", "Abraham", "Adam"])
Question.create(category_id: 1, prompt: "How many times did Noah send out a dove from the ark?", correct_answer: "1 Time", incorrect_answers: ["2 Times", "3 Times", "He Never Sent A Dove"])
Question.create(category_id: 1, prompt: "Which of the following countries is only bordered by one country?", correct_answer: "Lesotho", incorrect_answers: ["El Salvador", "Togo", "Mongolia"])

Question.create(category_id: 2, prompt: "What is the first book of the Old Testament?", correct_answer: "Genesis", incorrect_answers: ["Exodus", "Leviticus", "Numbers"])
Question.create(category_id: 2, prompt: "How many books are there in the standard Bible?", correct_answer: "66", incorrect_answers: ["39", "54", "72"])
Question.create(category_id: 2, prompt: "At the time of the census which was conducted by Moses in the first chapter of Numbers, which of the twelve tribes of Israel was the largest?", correct_answer: "Judah", incorrect_answers: ["Gad", "Asher", "Ruben"])
Question.create(category_id: 2, prompt: "Which of the following animals were the Israelites forbidden to eat by the Old Testament?", correct_answer: "Rabbit", incorrect_answers: ["Antelope", "Sheep", "Goat"])
Question.create(category_id: 2, prompt: "When were Israelites required to free their servants?", correct_answer: "In The 7th Year Of Their Service", incorrect_answers: ["Never", "When The Servants Produced Offsprings", "In The 12th Year Of Their Service"])
Question.create(category_id: 2, prompt: "Who climbed a sycamore tree in order to see Jesus as he entered Jericho?", correct_answer: "Zacchaues", incorrect_answers: ["Nebuchadnezzar", "Nicodemus", "Zerrubbabel"])
Question.create(category_id: 2, prompt: "Who was chosen to replace Judas as the twelfth apostle?", correct_answer: "Matthias", incorrect_answers: ["Paul", "Andrew", "Bartholomew"])
Question.create(category_id: 2, prompt: "Who did Peter raise from the dead in Joppa?", correct_answer: "Dorcas", incorrect_answers: ["Lazarus", "Ananias", "Martha"])
Question.create(category_id: 2, prompt: "Who built the first city?", correct_answer: "Cain", incorrect_answers: ["Enoch", "Abraham", "Adam"])
Question.create(category_id: 2, prompt: "How many times did Noah send out a dove from the ark?", correct_answer: "1 Time", incorrect_answers: ["2 Times", "3 Times", "He Never Sent A Dove"])
Question.create(category_id: 2, prompt: "Which of the following countries is only bordered by one country?", correct_answer: "Lesotho", incorrect_answers: ["El Salvador", "Togo", "Mongolia"])
