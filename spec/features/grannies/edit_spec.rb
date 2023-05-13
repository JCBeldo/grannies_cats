require 'rails_helper'

RSpec.describe 'Grannies show page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }
  let!(:cat_1) { granny_1.cats.create!(name: "Snuffles", spayed_neutered: true, lives: 9) }
  let!(:cat_2) { granny_1.cats.create!(name: "Poopykins", spayed_neutered: true, lives: 9) }
  let!(:cat_3) { granny_1.cats.create!(name: "Sillyfluff", spayed_neutered: true, lives: 7) }
  let!(:cat_4) { granny_2.cats.create!(name: "Mr. Wiskers", spayed_neutered: false, lives: 6) }
  let!(:cat_5) { granny_3.cats.create!(name: "DingPu", spayed_neutered: true, lives: 9) }

  describe 'displays a form to edit an existing granny and redirects to the grannies show' do
    it 'should display a form to edit an existing granny and gets filled in' do
      visit "grannies/#{granny_1.id}/edit"
      
      expect(page).to have_button("Update")

      have_unchecked_field
      fill_in("Age", with: 78)
      click_button("Update")

      expect(current_path).to eq("/grannies/#{granny_1.id}")
      
      expect(page).to have_content(false)
      expect(page).to have_content(78)
      
    end
  end
end