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
end
