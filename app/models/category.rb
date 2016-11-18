class Category < ApplicationRecord
  has_many :products, class_name: Product.name, foreign_key: :category_id

  def set_category parent_id
    max_right = get_max_right
    if parent_id.empty?
      if max_right.nil?
        self.update(left_node: 1, right_node: 2, depth: 1)
      else
        self.update(left_node: max_right + 1,
          right_node: max_right + 2, depth: 1)
      end
    else
      parent_category = Category.find_by id: parent_id
      Category.where("right_node >= ?",parent_category.right_node.to_i)
        .update_all("right_node = right_node + 2")
      Category.where("left_node >= ?", parent_category.right_node.to_i)
        .update_all("left_node = left_node + 2")
      self.update(left_node: parent_category.right_node.to_i,
        right_node: parent_category.right_node.to_i + 1,
        depth: parent_category.depth.to_i + 1)
    end
  end

  def destroy
    Category.where("left_node between ? and ?",
      self.left_node, self.right_node).each do |category|
      category.delete
    end
    rebuild_left_right_index
  end

  def self.search name
    categories = Category.all
    categories =
      categories.where("category_name LIKE ?","%#{name}%") if name.present?
    categories
  end

  private
  def get_max_right
    Category.where("depth = ?", 1).maximum(:right_node)
  end

  def rebuild_left_right_index
    width = self.right_node - self.left_node + 1
    Category.where("left_node > ?", self.right_node)
    .update_all("left_node = left_node - #{width}")
    Category.where("right_node > ?", self.right_node)
    .update_all("right_node = right_node - #{width}")
  end
end
