class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
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

  def for_form
    self.category.params_config.map{|c|eval(c)}
  end

end
