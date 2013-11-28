Sequel.migration do
  change do
    create_table(:articles) do
      primary_key :id
      foreign_key :article_group_id, :article_groups, :null=>false

      String :name, :null=>false, :size=>100
      String :description, :null=>false, :size=>200, :default=>""
      DateTime :created_at, :null=>false, :default=>Sequel.function(:now)

      unique [:article_group_id, :name]
    end
  end
end
