require 'rails_helper'

RSpec.describe HogwartsService do
  it 'exists' do
    service = HogwartsService.new

    expect(service).to be_a HogwartsService
  end

  describe '.students_for_house' do
    it 'returns a hash of information for students from a specific house' do
      service = HogwartsService.new

      students = service.students_for_house("Slytherin")

      expect(students).to be_a Hash
      expect(students).to have_key :attributes
      expect(students[:attributes]).to have_key :students
      expect(students[:attributes][:students]).to be_a Array
      expect(students[:attributes][:students][0]).to have_key :id
      expect(students[:attributes][:students][0]).to have_key :name
    end
  end
end
