class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false, index: true
      t.string :description

      t.timestamps
    end
  end
end
