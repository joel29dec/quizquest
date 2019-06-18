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
  while count <= 5 do
    trivia = RestClient.get("https://opentdb.com/api.php?amount=50")
    results = JSON.parse(trivia)['results']
    create_questions(results)
    count += 1
  end
end

# def create_questions(results)
#   results.each {|result|
#     create_category(result)
#     Question.find_or_create_by(result)
#   }
# end

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
  Category.all.each {|category|
    category.update(name: category.name.gsub(/&quot;/,'"'))
    category.update(name: category.name.gsub(/&#039;/,"'"))
  }

  Question.all.each {|question|
    question.update(prompt: question.prompt.gsub(/&quot;/,'"'))
    question.update(correct_answer: question.correct_answer.gsub(/&#039;/,"'"))
    question.update(incorrect_answers: question.incorrect_answers.gsub(/&quot;/,'"'))
    question.update(incorrect_answers: question.incorrect_answers.gsub(/&#039;/,"'"))
    })
  }
end

# JSON.parse(data.replace(/&quot;/g,'"'));
# initial_parse
remove_quote
