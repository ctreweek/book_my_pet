Booking.destroy_all
Dog.destroy_all
User.destroy_all

puts "creating seeds"

@users = []
10.times do
  @users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: "1234567890"
  )

end

# dog = Dog.new({ name: 'Louis', breed: 'Pug', description: 'Such a fun pup!', age: 6})
# dog.user = user
# dog.save!


@breeds = ["black lab", "yellow lab", "pug", "huskey", "shih tzu", "boston terrier"]
9.times do
  url = "http://lorempixel.com/1600/600/animals/" + rand(1..10).to_s
  dog = Dog.new ({
    name: Faker::Name.first_name,
    breed: @breeds.sample ,
    description: "Fun loving dog! Hobbies include playing fetch and long walks. I'm a snuggler!",
    age: rand(0..12)
    })
  dog.user_id = User.all.sample.id
  dog.save!
  dog.photo_url = url
end

puts "done!"

