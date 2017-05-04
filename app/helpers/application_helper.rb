module ApplicationHelper
  def pagina(url)
    params = Rack::Utils.parse_query URI(url).query
    return params['page'].to_i unless params['page'].nil?
  end
end
