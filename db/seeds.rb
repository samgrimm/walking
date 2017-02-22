user = User.create!(
    email: 'test@test.com',
    password: 'foobar',
    password_confirmation: 'foobar'
    )
puts "Created one user"

14.times do |walk|
    walk = User.last.walks.create!
    walk.create_start_location(address: "800 Brazos st, Austin, TX")

    walk.create_end_location(address: "300 Guadalupe st, Austin, TX")
end

puts "Created 14 walks"

    
