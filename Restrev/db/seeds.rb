# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  1.upto(10) do |i|
    User.create(:name => "User #{i}", :email => "#{i}@user.com")
    Restaurant.create(:name => "Restaurant number #{i}", :genre => "French")
  end
  1.upto(5) do |i|
    1.upto(5) do |j|
      Rating.create(:user_id => i, :restaurant_id => j,
       :stars => j, :details => "I had #{j} fish" )
    end
  end
end
