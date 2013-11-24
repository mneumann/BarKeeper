require 'data_mapper'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://mneumann@localhost/test2')

$LOAD_PATH << "."
require 'model'
 
DataMapper.finalize
DataMapper.auto_migrate!
DataMapper::Model.raise_on_save_failure = true

#
# Create some initial data
#

group1 = ArticleGroup.create(name: "Beverages")
art1 = group1.articles.create(name: "Beer")
art1.prices.create(price: 1.2)
art2 = group1.articles.create(name: "Water")
art2.prices.create(price: 0.5)

group2 = ArticleGroup.create(name: "Candy")
art3 = group2.articles.create(name: "Chocolate")
art3.prices.create(price: 1)


user1 = User.create(name: "Michael", email: "test@test.de", password_sha1: "test")

ArticleGroup.each do |ag|
  p ag
  ag.articles.each do |article|
    p article
  end
  puts "----------------------"
end
