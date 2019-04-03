require 'rails_helper'

describe 'Searching for students' do
  context 'as a visitor' do
    it 'I can search for students by house' do
      visit root_path

      select 'Slytherin', from: :house

      click_on 'Get Students'

      expect(current_path).to eq(search_path)

      expect(page).to have_content("22 Students")

      students = page.find_all('.student')

      expect(students.length).to eq(22)

      students.each do |student|
        within student do
          expect(page).to have_content("ID:")
          expect(page).to have_content("Name:")
        end
      end
    end
  end
end
