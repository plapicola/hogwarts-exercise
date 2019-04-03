require 'rails_helper'

RSpec.describe Student do
  it 'exists' do
    student = Student.new({})

    expect(student).to be_a Student
  end

  describe 'attributes' do
    before :each do
      @student_info = {id: 1, name: "Person One"}
      @student = Student.new(@student_info)
    end

    it 'has an id' do
      expect(@student.id).to eq(@student_info[:id])
    end

    it 'has a name' do
      expect(@student.name).to eq(@student_info[:name])
    end
  end
end
