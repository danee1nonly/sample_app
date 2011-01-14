require 'faker'

namespace :db do
  desc "Fill database w sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_locations
    make_microposts
  end
end

def make_users
    admin = User.create!(:name => "Admin", :email => "admin@admin.com", :password => "password", :password_confirmation => "password")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@watever.com"
      password = "password"
      User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
    end  
end

def make_microposts
    Location.all(:limit => 5).each do |location|
      5.times do |n|
        location.microposts.create!(:title => Faker::Lorem.words, :content => Faker::Lorem.sentence(5), :user_id => 0)
      end
    
    end
    User.all(:limit => 6).each do |user|
      50.times do |n|
        user.microposts.create!(:title => Faker::Lorem.words, :content => Faker::Lorem.sentence(5), :location_id => 1)
      end
    
    end  
  end
    
def make_locations
    10.times do |n|
      name = Faker::Address.city
      Location.create!(:name => name)
    end   
end