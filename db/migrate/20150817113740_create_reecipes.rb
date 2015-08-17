class CreateReecipes < ActiveRecord::Migration
  def change
    create_table :reecipes do |t|
      t.text :name
      t.text :summary
      t.text :description
      t.timestamps :null

    end
  end
end
