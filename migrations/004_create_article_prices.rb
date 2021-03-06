Sequel.migration do
  change do
    create_table(:article_prices) do
      primary_key :id
      foreign_key :article_id, :articles, :null=>false
      BigDecimal :price, :null=>false, :size=>[8,2]
      DateTime :created_at, :null=>false, :default=>Sequel.function(:now)
    end
  end
end
