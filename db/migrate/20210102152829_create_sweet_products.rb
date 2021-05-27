class CreateSweetProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :sweet_products do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :sugar_substitute, default: false, null: false
      t.float :price, default: 23.50, null: false
      t.string :content

      t.timestamps
    end
  end
end
