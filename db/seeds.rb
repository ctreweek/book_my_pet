User.destroy_all
Dog.destroy_all

puts "creating seeds"

10.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: "1234567890"
  )

  user.save!
end

dog = Dog.new({ name: 'Louis', breed: 'Pug', description: 'Such a fun pup!', age: 6})
dog.user = user
dog.save!
puts "done!"
