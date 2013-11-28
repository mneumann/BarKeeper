Sequel.migration do
  change do
    create_table(:article_groups) do
      primary_key :id
      String :name, :null=>false, :size=>100, :unique=>true
    end
  end
end
