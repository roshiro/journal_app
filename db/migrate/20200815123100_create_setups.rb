class CreateSetups < ActiveRecord::Migration[6.1]
  def change
    create_table :setups do |t|
      t.string :name
      t.string :description
      t.integer :strategy_id, null: false

      t.timestamps
    end
  end
end
