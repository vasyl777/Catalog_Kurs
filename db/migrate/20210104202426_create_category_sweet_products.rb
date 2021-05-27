class CreateCategorySweetProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :category_sweet_products do |t|
      t.integer :category_id
      t.integer :sweet_product_id

      t.timestamps
    end
  end
end
