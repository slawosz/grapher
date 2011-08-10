def destroy_tables
  ActiveRecord::Migration.drop_table(:posts)
  ActiveRecord::Migration.drop_table(:comments)
end
