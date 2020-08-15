class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :symbol
      t.text :content
      t.datetime :open_date
      t.datetime :close_date
      t.decimal :risk_in_amount
      t.decimal :result_in_amount

      t.timestamps
    end
  end
end
