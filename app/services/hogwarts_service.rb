class HogwartsService
  def students_for_house(house)
    get_json("/api/v1/house/#{house}")[:data][0]
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-it.herokuapp.com/') do |faraday|
      faraday.params["api_key"] = '3fhZMZNXVndxk51mILsdVnGN6tF8KBI6'
      faraday.adapter Faraday.default_adapter
    end
  end
end
