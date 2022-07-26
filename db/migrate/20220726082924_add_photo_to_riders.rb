class AddPhotoToRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :riders, :photo_url, :string
  end
end
