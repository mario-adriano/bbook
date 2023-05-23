class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :title
      t.text :description
      t.integer :original_pushication_year

      t.timestamps
    end
  end
end
