class AddUserIdToThumbs < ActiveRecord::Migration
  def change
    add_reference :thumbs, :user, index: true, foreign_key: true
  end
end
