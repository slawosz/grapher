def create_tables
  ActiveRecord::Migration.create_table(:posts) do |t|
    t.string :name
    t.text   :content
    
    t.timestamps
  end

  ActiveRecord::Migration.create_table(:comments) do |t|
    t.text    :content
    t.string  :author
    t.integer :post_id
    
    t.timestamps
  end
end
