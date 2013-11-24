class User
  include DataMapper::Resource

  property :id, Serial

  property :name, String,  length: 100, required: true
  property :email, String, length: 100, required: true, unique: true, format: :email_address
  property :description, String, length: 100, default: "", allow_nil: false
  property :password_sha1, String, length: 40, required: true
  property :is_admin, Boolean, default: false, required: true
  property :balance, Decimal, default: 0, required: true

  property :created_at, DateTime, allow_nil: false

  has n, :user_transactions
end

class ArticleGroup
  include DataMapper::Resource

  property :id, Serial
  property :name, String, length: 100, required: true, unique: true

  has n, :articles
end

# TODO: unique(article_group_id, name)
class Article
  include DataMapper::Resource

  property :id, Serial
  property :name, String, length: 100, required: true
  property :description, String, length: 200, default: "", allow_nil: false

  property :created_at, DateTime, allow_nil: false

  belongs_to :article_group
  has n, :prices
end

class Price
  include DataMapper::Resource

  property :id, Serial
  property :price, Decimal, required: true, scale: 2, precision: 7
  property :created_at, DateTime, allow_nil: false

  belongs_to :article
end

class UserTransaction
  include DataMapper::Resource

  property :id, Serial
  property :count, Integer, required: true
  property :created_at, DateTime, allow_nil: false

  belongs_to :user
  belongs_to :price
end

class UserPayment
  include DataMapper::Resource

  property :id, Serial

  property :amount, Decimal, required: true
  property :created_at, DateTime, allow_nil: false

  belongs_to :user
end
