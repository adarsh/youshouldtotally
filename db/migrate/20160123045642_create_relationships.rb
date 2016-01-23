class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false
    end

    %i(follower_id followed_id).each do |column_name|
      add_foreign_key :relationships, :users, column: column_name
      add_index :relationships, column_name
    end
  end
end
