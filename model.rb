class User < Sequel::Model
  one_to_many :user_transactions
  one_to_one :user_balance

  def get_balance
    user_balance.balance
  end

  def buy(article_price, count=1)
    User.db.transaction do
      UserTransaction.create(count: count, user: self, price: article_price)
      total = count * article_price.price 
      self.user_balance_dataset.update(:balance => Sequel.+(:balance, total))
    end
  end
end

class ArticleGroup < Sequel::Model
  one_to_many :articles
end

class Article < Sequel::Model
  many_to_one :article_group
  one_to_many :prices
end

class Price < Sequel::Model
  many_to_one :article
end

class UserTransaction < Sequel::Model
  many_to_one :user
  many_to_one :price
end

class UserPayment < Sequel::Model
  many_to_one :user
end

class UserBalance < Sequel::Model
  #one_to_one :user
end
