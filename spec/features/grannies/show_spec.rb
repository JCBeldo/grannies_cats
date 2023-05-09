require 'rails_helper'

RSpec.describe 'Grannies show page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }

  describe 'displays the attributes of a particular granny' do
    it 'should display the name and age of each granny' do
      visit "/grannies/#{granny_1.id}"
      
      expect(page).to have_content(granny_1.name)
      expect(page).to have_content(granny_1.age)
      expect(page).to_not have_content(granny_2.age)
      expect(page).to_not have_content(granny_3.name)
    end

    it 'should display whether granny has treats or not' do
      visit "/grannies/#{granny_2.id}"
      
      expect(page).to have_content(granny_2.has_treats)
      expect(page).to_not have_content(granny_3.has_treats)
    end
  end
end