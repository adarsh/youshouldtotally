class CreateTelevisionShows < ActiveRecord::Migration
  def change
    create_table :television_shows do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

    add_index :television_shows, :title, unique: true
  end
end
