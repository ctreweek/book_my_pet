puts "creating seeds"

10.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: "1234567890"
  )
  user.save!
end

dogs = []
dogs << Dog.create!({ name: 'Louis', breed: 'Pug', description: 'Such a fun pup!', age: 6})
puts "done!"
