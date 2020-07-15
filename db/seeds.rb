# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.where(user_id: nil).delete_all
User.all.each { |u| u.destroy! }
Category.delete_all

User.create!(
  name: Faker::Name.unique.name,
  email: Faker::Internet.unique.email,
  password: '123456',
  password_confirmation: '123456',
  admin: true
)

10.times do |i|
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: '123456',
    password_confirmation: '123456'
  )
end

Category.create!([
  { name: 'sports' },
  { name: 'cars' },
  { name: 'pets' }
])

description = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
User.all.each do |user|
  rand(10).times do
    title = Faker::Book.title
    article = Article.find_by(title: title)
    counter = 1
    while article
      counter += 1
      article = Article.find_by(title: "#{title} #{counter}")
    end
    title += counter == 1 ? '' : " #{counter}"
    chance = rand(1)
    if chance == 1
      user.articles.create(
        title: title,
        description: description,
        category_ids: Category.first(rand(3) + 1).to_a.map(&:id)
      )
    else
      user.articles.create(
        title: title,
        description: description,
        category_ids: Category.last(rand(3) + 1).to_a.map(&:id)
      )
    end
  end
end

