class Answer < ApplicationRecord
  belongs_to :question
  store :config, coder: JSON

  def find_template
  template = self.question.category.name
  "admin/answers/#{template}/create.js.erb"
  end
end
