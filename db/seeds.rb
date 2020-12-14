AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Category.create!(name: "checkbox")
Category.create!(name: "date_range")
