# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create([{email: 'me@you.com', password: 'password'}])
b = Post.create([{title: 'New Post', body: 'New Post Body', user_id: 1}])
t = Tag.create([{name: 'Spring'}])
Tagging.create(post_id: 1, tag_id: 1)
user2 = User.create([{email: 'us@you.com', password: 'password'}])
b2 = Post.create([{title: 'New Post', body: 'New Post Body', user_id: 2}])
t2 = Tag.create([{name: 'Summer'}])
Tagging.create(post_id: 2, tag_id: 2)

user3 = User.create([{email: 'them@you.com', password: 'password'}])
b3 = Post.create([{title: 'I Share Related Tags to User 1', body: 'New Post Body', user_id: 3}])
Tagging.create(post_id: 3, tag_id: 1)

b4 = Post.create([{title: 'New Post', body: 'New Post Body', user_id: 1}])
t3 = Tag.create({name: 'Winter'})
Tagging.create(post_id: 4, tag_id: 3)
b5 = Post.create([{title: 'New Post', body: 'New Post Body', user_id: 3}])
t4 = Tag.create({name: 'Autumn'})
Tagging.create(post_id: 5, tag_id: 4)
b6 = Post.create([{title: 'I Also Share Related Tags to User 1', body: 'New Post Body', user_id: 2}])
Tagging.create(post_id: 6, tag_id: 1)
b7= Post.create([{title: 'New Post', body: 'New Post Body', user_id: 3}])
Tagging.create(post_id: 7, tag_id: 4)
