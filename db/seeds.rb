# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Review.destroy_all if Rails.env.development?

puts 'Creating restaurant...'
gaetano = Restaurant.create(
  name: 'Pizzeria Gaetano',
  address: '4 place Amiral Senes 83000 Toulon',
  phone_number: '09 09 06 05 94',
  category: 'italian'
)

puts 'Adding reviews...'

first_review = Review.new(
  content: 'good',
  rating: rand(0..5)
)
first_review.restaurant = gaetano
first_review.save

second_review = Review.new(
  content: 'very good',
  rating: rand(0..5)
)
second_review.restaurant = gaetano
second_review.save

third_review = Review.new(
  content: 'beautiful',
  rating: rand(0..5)
)
third_review.restaurant = gaetano
third_review.save

fourth_review = Review.new(
  content: 'Good pizza',
  rating: rand(0..5)
)
fourth_review.restaurant = gaetano
fourth_review.save

  fifth_review = Review.new(
  content: 'So nice!',
  rating: rand(0..5)
)
fifth_review.restaurant = gaetano
fifth_review.save

puts 'Created'
puts 'Finished !'
