User.destroy_all
u1 = User.create :email => 'socks@ga.co', :name => 'Socks', :image => 'http://placekitten.com/200/300', :password => 'chicken'
u2 = User.create :email => 'boots@ga.co', :name => 'Boots', :image => 'http://placekitten.com/200/200', :password => 'chicken'
puts "#{User.count} users were created."

Post.destroy_all
p1 = Post.create :message => 'first post lol', :image => 'http://placekitten.com/300/300', :start_time => DateTime.new(2020,3,16,17)
p2 = Post.create :message => 'new day', :image => 'http://placekitten.com/300/400', :start_time => DateTime.new(2020,3,15,17)
puts "#{Post.count} posts created."

# ASSOCIATIONS
puts "Posts"
u1.posts << p2
u2.posts << p1
