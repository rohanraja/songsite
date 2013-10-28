class CreateSongItems < ActiveRecord::Migration
  def change
    create_table :song_items do |t|
      t.text :path
      t.string :title
      t.string :album
      t.string :artist
      t.string :genre

      t.timestamps
    end
  end
end
