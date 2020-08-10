class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :symbol
      t.text :content
      t.datetime :open_date
      t.datetime :close_date
      t.decimal :result

      t.timestamps
    end
  end
end
