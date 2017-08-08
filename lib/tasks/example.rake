task :hello do
  puts "Hello Руби"
end

task :chain => :hello do
  puts " Я Чайн"
end

namespace :user do
  desc 'Последний пользователь'
  task :last => :environment do
    user = User.last
    puts user.username
  end

  desc 'Первый пользователь'
  task :first => :environment do 
    user = User.first
    puts user.username
  end

  desc 'Новый пользователь'

  task :create, [:username, :email, :password] => :environment do |task, args|
    User.create!(username: args[:username], email: args[:email], password: args[:password])
  end
 
end
