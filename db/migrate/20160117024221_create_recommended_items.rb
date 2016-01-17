class CreateRecommendedItems < ActiveRecord::Migration
  def change
    create_table :recommended_items do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :television_show_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :recommended_items, :users
    add_foreign_key :recommended_items, :television_shows

    add_index :recommended_items, :user_id
    add_index :recommended_items, :television_show_id
    add_index :recommended_items, [:user_id, :television_show_id], unique: true
  end
end
