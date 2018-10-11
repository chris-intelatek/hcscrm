module CookieManager
  extend ActiveSupport::Concern

  def set_cookie(key, value)
    cookies[key.to_sym] = value
  end

  def get_cookie(key)
    cookies[key.to_sym]
  end

  def clear_cookie(key)
    set_cookie(key, nil)
  end
end