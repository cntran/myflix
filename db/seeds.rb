# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'cntran@gmail.com', full_name: 'Craig Tran', password: 'password')

v1 = Video.create(title: 'South Park', description: 'South Park is an American adult animated sitcom created by Trey Parker and Matt Stone for the Comedy Central television network.', small_cover_url: '/tmp/south_park.jpg')

v2 = Video.create(title: 'Futurama', description: 'Futurama is an American adult animated science fiction sitcom created by Matt Groening and developed by Groening and David X. Cohen for the Fox Broadcasting Company', small_cover_url: '/tmp/futurama.jpg')

v3 = Video.create(title: 'Monk', description: 'Monk is an American comedy-drama detective mystery television series created by Andy Breckman and starring Tony Shalhoub as the eponymous character, Adrian Monk.', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg')

v4 = Video.create(title: 'South Park', description: 'South Park is an American adult animated sitcom created by Trey Parker and Matt Stone for the Comedy Central television network.', small_cover_url: '/tmp/south_park.jpg')

v5 = Video.create(title: 'Futurama', description: 'Futurama is an American adult animated science fiction sitcom created by Matt Groening and developed by Groening and David X. Cohen for the Fox Broadcasting Company', small_cover_url: '/tmp/futurama.jpg')

v6 = Video.create(title: 'Monk', description: 'Monk is an American comedy-drama detective mystery television series created by Andy Breckman and starring Tony Shalhoub as the eponymous character, Adrian Monk.', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg')

v7 = Video.create(title: 'South Park', description: 'South Park is an American adult animated sitcom created by Trey Parker and Matt Stone for the Comedy Central television network.', small_cover_url: '/tmp/south_park.jpg')

v8 = Video.create(title: 'Futurama', description: 'Futurama is an American adult animated science fiction sitcom created by Matt Groening and developed by Groening and David X. Cohen for the Fox Broadcasting Company', small_cover_url: '/tmp/futurama.jpg')

v9 = Video.create(title: 'Monk', description: 'Monk is an American comedy-drama detective mystery television series created by Andy Breckman and starring Tony Shalhoub as the eponymous character, Adrian Monk.', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg')

c1 = Category.create(title: 'Comedy')
c2 = Category.create(title: 'Drama')

c1.videos = [ v1, v2, v3, v4, v5, v6, v7 ]
c2.videos = [ v8, v9 ]

