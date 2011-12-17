namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    require 'populator'
    require 'faker'
    
    [Flower, Category, Gift].each(&:delete_all)


    Category.populate 3 do |category|
      category.name = Populator.words(2).titleize
      category.description = Faker::Lorem.paragraphs(2)

      Flower.populate 30 do |flower|
        flower.name = Populator.words(2).titleize
        flower.category_id = category.id
        flower.description = Faker::Lorem.paragraphs(2)
        flower.price = 100..800
        flower.storage_id = 1..3
        flower.rate = 0..20
        flower.discount = 0..20
        flower.f_type = ["natural", "bunch", "single"]
      end

    end

    Gift.populate 10 do |gift|
      gift.name = Populator.words(2).titleize
      gift.description = Faker::Lorem.paragraphs(2)
      gift.price 50..200
    end

    AdminUser.populate 1 do |au|
      au.email = "ususus1@yandex.ru"
      au.password = 2020327
      au.password_confirmation = 2020327
    end


  end
end