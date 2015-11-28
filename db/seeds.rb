include RandomData

#create topics

  30.times do

    Topic.create!(
    title: RandomData.random_sentence
    )
  end

  topics = Topic.all

  50.times do

    Bookmark.create!(
    topic: topics.sample,
    url: RandomData.random_url
    )
  end

  member = User.create!(
  username: 'Joel Scalera',
  email:    'joel.scalera@gmail.com',
  password: 'Yardyear92'
  )

  puts "Seeds finished"
  puts "#{Bookmark.count} bookmarks created"
  puts "#{Topic.count} topics created"
