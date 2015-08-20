class AddChefIdToReecipes < ActiveRecord::Migration
  def change
    add_column :reecipes, :chef_id, :integer
  end
end
