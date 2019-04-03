class SearchFacade
  def initialize(house)
    @house = house
  end

  def student_count
    get_students[:attributes][:students].count
  end

  def students
    get_students[:attributes][:students].map do |student_info|
      Student.new(student_info)
    end
  end

  private

  def get_students
    response = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}") do |f|
      f.params["api_key"] = '3fhZMZNXVndxk51mILsdVnGN6tF8KBI6'
    end

    JSON.parse(response.body, symbolize_names: true)[:data][0]
  end
end
