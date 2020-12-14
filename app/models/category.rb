class Category < ApplicationRecord
  has_many :questions
  CATEGORIES_NAME = [
    "checkbox",
    "date_range"
  ]
end
