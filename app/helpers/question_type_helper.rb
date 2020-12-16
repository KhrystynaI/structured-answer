module QuestionTypeHelper
  class Checkbox

    def self.sort_answers(data)
      questions = Question.select do |c|
        c.category.name == "checkbox"
      end
      answers = questions.select do |q|
        q.config[:options] == data
      end
      answers.map{|c|c.answers}
    end

  end

  class DateRange

    def self.sort_answers(data)
      questions = Question.select do |c|
        c.category.name == "date_range"
      end
      answers = questions.select do |q|
        q.config[:start].to_date <=  data.to_date && q.config[:finish].to_date >=  data.to_date
      end
      answers.map{|c|c.answers}
    end

  end
end
