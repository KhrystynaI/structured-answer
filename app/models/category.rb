class Category < ApplicationRecord
  has_many :questions


  CATEGORIES_NAME = [
    {select: :select},
    {check_boxes: :check_boxes},
    {radio: :radio},
    {text: :text},
    {time_zone: :time_zone},
    {password: :password},
    {date_select: :date_select},
    {country: :country},
    {select_second: :select},
    {check_boxes_second: :check_boxes},
    {radio_second: :radio},
    {text_second: :text},
    {time_zone_second: :time_zone},
    {password_second: :password},
    {date_select_second: :date_select},
    {country_second: :country}

  ]

end
