module ApplicationHelper
  def price_each_product_in_cart product, quantity
    return product.price.to_i * quantity.to_i
  end

  def get_short_description product
    return product.description.byteslice(0,60)
  end

  def index_for object, index, per_page
    (object.to_i - 1)*per_page + index + 1
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
    link_to_function(name, "add_fields(this, \"#{association}\",
      \"#{escape_javascript(fields)}\")")
  end

  def link_to_function name, *args, &block
    html_options = args.extract_options!.symbolize_keys
      function = block_given? ? update_page(&block) : args[0] || ""
      onclick = "#{"#{html_options[:onclick]};
    "if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || "#"
    content_tag(:a, name, html_options.merge(href: href, onclick: onclick))
  end

  def load_categories_menu
    @tree_menu = ""
    tree Category.all
  end

  private
  def tree categories, left = 0, right = nil, depth = 0
    @tree_menu += "<ul class='dropdown-menu'>" if left == 0 && right == nil && depth == 0
    categories.each do |category|
      if category.left_node > left && (right.nil? || category.right_node <
        right) && category.depth == depth + 1
        categories_temp = categories.compact
        categories_temp.delete category
        @tree_menu +=
          "<li class='dropdown custom-nav'>
          <a href='/categories/#{category.id}'>#{category.category_name}</a>"
        if category.right_node != (category.left_node + 1)
          @tree_menu += "<ul class='dropdown-menu' >"
          tree categories_temp, category.left_node, category.right_node,
            category.depth
          @tree_menu += "</ul>"
        end
        @tree_menu += "</li>"
      end
    end
    @tree_menu += "</ul>" if left == 0 && right.nil? && depth == 0
    @tree_menu
  end
end
