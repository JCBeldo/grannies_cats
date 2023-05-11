require 'rails_helper'

RSpec.describe 'Grannies show page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }

  describe 'displays a form to edit an existing granny and redirects to the grannies show' do
    it 'should display a form to edit an existing granny and gets filled in' do
      visit "grannies/#{granny_1.id}/edit"
      
      expect(page).to have_button("Update")

      fill_in("Has treats", with: false)
      fill_in("Age", with: 78)
      click_button("Update")

      expect(current_path).to eq("/grannies/#{granny_1.id}")
      
      expect(page).to have_content(false)
      expect(page).to have_content(78)
      
    end
  end
end