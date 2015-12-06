include RandomData



  15.times do
    User.create!(
    username: RandomData.random_word,
    email:    RandomData.random_email,
    password: RandomData.random_sentence


    )
  end
  users = User.all
#create topics

  30.times do

    Topic.create!(
    user: users.sample,
    title: RandomData.random_sentence
    )
  end

  topics = Topic.all

  50.times do

    Bookmark.create!(
    user:  users.sample,
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
  puts "#{User.count} users created"
  puts "#{Bookmark.count} bookmarks created"
  puts "#{Topic.count} topics created"
