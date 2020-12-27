class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy

  store :config, coder: JSON

  
  def for_form
    self.category.params_config.map{|c|eval(c)}
  end

end
