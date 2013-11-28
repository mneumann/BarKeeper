require 'sequel'

DB = Sequel.connect('postgres://mneumann@localhost/test')

$LOAD_PATH << "."
require 'model_seq'


#
# Create some initial data
#
user1 = User.create(:name => "Michael", :email => "test@test.de", :password_sha1 => "test")
p user1

group1 = ArticleGroup.create(name: "Beverages")
art1 = group1.add_article(name: "Beer")
art1.add_price(price: 1.2)
art2 = group1.add_article(name: "Water")
art2.add_price(price: 0.5)

group2 = ArticleGroup.create(name: "Candy")
art3 = group2.add_article(name: "Chocolate")
art3.add_price(price: 1)


ArticleGroup.each do |ag|
  p ag
  ag.articles.each do |article|
    p article
  end
  puts "----------------------"
end

p user1.buy(ArticleGroup.first.articles.first.prices.first, 2)
