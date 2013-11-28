Sequel.migration do
  change do
    create_table(:user_payments) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false

      BigDecimal :amount, :null=>false, :size=>[8,2]
      DateTime :created_at, :null=>false
    end
  end
end
