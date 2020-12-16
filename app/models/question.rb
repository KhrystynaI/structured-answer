class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  include Storext.model
  store :config, coder: JSON
  OPTIONS ={
    days: "days",
    months: "months",
    years: "years"
  }
  HINT_FOR_CHECKBOX =[
    "test",
    "test2"
  ]

  def self.get_answers(data, formatter)
    formatter.sort_answers(data)
  end
end
