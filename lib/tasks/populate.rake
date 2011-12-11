namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    require 'populator'
    require 'faker'
    
    [Flower, Category].each(&:delete_all)


    Category.populate 3 do |category|
      category.name = Populator.words(2).titleize
      category.description = Faker::Lorem.paragraphs(2)

      Flower.populate 30 do |flower|
        flower.name = Populator.words(2).titleize
        flower.category_id = category.id
        flower.description = Faker::Lorem.paragraphs(2)
        flower.price = 100..800
        flower.storage_id = 1..3
      end

    end


  end
end