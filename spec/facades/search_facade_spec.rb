require 'rails_helper'

RSpec.describe SearchFacade do
  it 'exists' do
    facade = SearchFacade.new("Slytherin")

    expect(facade).to be_a SearchFacade
  end

  describe '.student_count' do
    it 'returns the total count of students matching the requested house' do
      facade = SearchFacade.new("Slytherin")

      expect(facade.student_count).to eq(22)
    end
  end

  describe '.students' do
    it 'returns the students from the house' do
      facade = SearchFacade.new("Slytherin")

      expect(facade.students.length).to eq(22)
      expect(Facade.students.all? {|s| s.class == Student}).to be true
    end
  end
end
