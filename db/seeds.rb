# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.where(user_id: nil).delete_all
User.all.each { |u| u.destroy }

user = User.create(
  name: 'jen smith',
  email: 'jen.smith@example.org',
  password: '123456',
  password_confirmation: '123456',
  admin: true
)

10.times do |i|
  User.create(
    name: "george melquiades #{i}",
    email: "george.#{i}@example.org",
    password: '123456',
    password_confirmation: '123456'
  )
end

11.times do |i|
  user.articles.create(
    title: "Article #{i}",
    description: 'Lorem ipsum dolor sit amet consecteur adeptum'
  )
end
