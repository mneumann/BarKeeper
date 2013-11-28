Sequel.migration do
  change do
    create_table(:user_transactions) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false
      foreign_key :price_id, :prices, :null=>false

      Integer :count, :null=>false
      DateTime :created_at, :null=>false, :default=>Sequel.function(:now)
    end
  end
end
