class Category < ApplicationRecord
  has_many :questions, dependent: :destroy


  CATEGORIES_NAME = [
    {select: :select},
    {check_boxes: :check_boxes},
    {radio: :radio},
    {text: :text},
    {time_zone: :time_zone},
    {password: :password},
    {date_select: :date_select},
    {country: :country},
    {time_select: :time_select},
    {boolean: :boolean},
    {string: :string},
    {number: :number},
    {email: :email},
    {url: :url},
    {phone: :phone},
    {range: :range},
    {file: :file},
    {datalist: :datalist},
    {select_second: :select},
    {check_boxes_second: :check_boxes},
    {radio_second: :radio},
    {text_second: :text},
    {time_zone_second: :time_zone},
    {password_second: :password},
    {date_select_second: :date_select},
    {country_second: :country},
    {time_select_second: :time_select},
    {boolean_second: :boolean},
    {string_second: :string},
    {number_second: :number},
    {email_second: :email},
    {url_second: :url},
    {phone_second: :phone},
    {range_second: :range},
    {file_second: :file},
    {datalist_second: :datalist}
  ]

end
