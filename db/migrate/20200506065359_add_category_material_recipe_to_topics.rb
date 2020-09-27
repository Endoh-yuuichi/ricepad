class AddCategoryMaterialRecipeToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :category_id, :integer
    add_column :topics, :material, :string
    add_column :topics, :recipe, :string
  end
end
