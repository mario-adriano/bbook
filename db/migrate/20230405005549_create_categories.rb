class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
