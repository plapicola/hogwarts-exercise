class HogwartsService
  def students_for_house(house_id)
    get_json("house/#{house_id}")
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com/api/v1/') do |faraday|
      faraday.headers["x-api-key"] = 'oPGaRUMm7Cpisj6fosH8VhIgjnxx8zh1'
      faraday.adapter Faraday.default_adapter
    end
  end
end
