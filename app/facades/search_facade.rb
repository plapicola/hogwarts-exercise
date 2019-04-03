class SearchFacade
  def initialize(house)
    @house = house
    @service = HogwartsService.new
  end

  def student_count
    get_students.count
  end

  def students
    get_students.map do |student_info|
      Student.new(student_info)
    end
  end

  private

  def get_students
    @service.students_for_house(@house)
  end
end
