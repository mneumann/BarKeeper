Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :name, :null=>false, :size=>100
      String :email, :null=>false, :size=>100, :unique=>true
      String :description, :null=>false, :size=>100, :default=>""
      String :password_sha1, :null=>false, :size=>40, :fixed=>true
      FalseClass :is_admin, :null=>false, :default=>false
      DateTime :created_at, :null=>false, :default=>Sequel.function(:now)
    end
  end
end
