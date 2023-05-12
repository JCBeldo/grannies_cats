require 'rails_helper'

RSpec.describe 'Grannies new page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }

  describe 'displays a form to create a new granny and redirects to the grannies index' do
    it 'should display a form to create a new granny and gets filled in' do
      visit "grannies/new"
      
      expect(page).to have_button("Create Granny")

      fill_in("Name", with: "Edna")
      fill_in("Has treats", with: true)
      fill_in("Age", with: 69)
      click_button("Create Granny")

      expect(current_path).to eq("/grannies")
      
      expect(page).to have_content("Edna")
    end
  end
end