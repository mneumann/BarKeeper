Sequel.migration do
  change do
    create_table(:user_balances) do
      foreign_key :user_id, :users, :null=>false, :unique=>true
      BigDecimal :balance, :null=>false, :size=>[8,2], :default=>0
    end
  end
end
