class Answer < ApplicationRecord
  belongs_to :question
  store :config, coder: JSON
end
