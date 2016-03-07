class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.belongs_to :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
