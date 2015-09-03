class AddPictureToReecipes < ActiveRecord::Migration
  def change
    add_column :reecipes, :picture, :string
  end
end
