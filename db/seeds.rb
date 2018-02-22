# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

joke = Joke.first

# create user
user = User.create({
  wechat_unionid: 'o6_bmasdasdsad6_2sgVt7hMZOPfL'
})

user_profile = UserProfile.create({
  user_id: user.id,
  avatar: 'http://waraimasu.com/avatar.png',
  name: 'test_user',
  phone: '18612345678',
  email: 'test_user@test.com',
  province: '广东省',
  city: '深圳市',
  address: '南山区测试村'
})

favorite = Favorite.create({
  user_id: user.id,
  joke_id: joke.id
})