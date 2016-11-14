module ProductsHelper
  def save_cookie_recent_product product
    if ids = cookies[:recent_view_ids]
      recent_view_ids = ids.split(/&/).map(&:to_i)
      unless recent_view_ids[0..3].include? product.id
        recent_view_ids.unshift product.id
        cookies.permanent[:recent_view_ids] = recent_view_ids[0..3]
      end
    else
      cookies.permanent[:recent_view_ids] = product.id
    end
  end

  def load_cookie_recent_product
    (ids = cookies[:recent_view_ids])? ids.split(/&/).map(&:to_i) : []
  end
end
