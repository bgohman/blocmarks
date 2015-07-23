Bookmark.destroy_all
User.destroy_all
Topic.destroy_all 

admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

brad = User.new(
  name:     'brad',
  email:    'bradley.s.gohman@gmail.com',
  password: 'helloworld'
)
brad.skip_confirmation!
brad.save!


topic1 = Topic.create(title: "Rails Development", user_id: brad.id)
topic2 = Topic.create(title: "Pure Ruby", user_id: brad.id)
bookmark1 = Bookmark.create(url: "https://www.bloc.io/", topic: Topic.first, user_id: brad.id)
bookmark2 = Bookmark.create(url: "https://www.railstutorial.org/", topic: Topic.first, user_id: brad.id)

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{User.count} users created"
 puts "#{Bookmark.count} bookmarks created"