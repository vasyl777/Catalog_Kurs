# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.first_or_create(email: 'admin@example.com', password: 'password',
                            password_confirmation: 'password')
end

sweet_products = []
20.times do
  sweet_products << {
    name: Faker::Food.fruits,
    description: Faker::Food.description,
    set_image: 'https://loremflickr.com/320/320/sweets',
    sugar_substitute: [true, false].sample
  }
end
SweetProduct.create(sweet_products)

SweetProduct.limit(20).each do |x|
  x.update(
    category_names: 3.times.map do
                      ['шоколадні цукерки', 'льодяники', 'карамель', 'ірис', 'вафельні цукерки', 'цукати',
                       'марципани', 'батончики', 'желейні цукерки', 'зефір'].sample
                    end.join(',')
  )
end
