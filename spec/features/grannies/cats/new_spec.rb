require 'rails_helper'

RSpec.describe 'grannies/:id/cats index page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }
  let!(:cat_1) { granny_1.cats.create!(name: "Snuffles", spayed_neutered: true, lives: 9) }
  let!(:cat_2) { granny_1.cats.create!(name: "Poopykins", spayed_neutered: true, lives: 9) }
  let!(:cat_3) { granny_1.cats.create!(name: "Sillyfluff", spayed_neutered: true, lives: 7) }
  let!(:cat_4) { granny_2.cats.create!(name: "Mr. Wiskers", spayed_neutered: false, lives: 6) }
  let!(:cat_5) { granny_3.cats.create!(name: "DingPu", spayed_neutered: true, lives: 9) }

  describe 'displays a new form to create a new cat associated with a granny' do
    it 'should display a form to fill in and then be submitted' do
      visit "/grannies/#{granny_2.id}/cats/new"

      expect(page).to have_button("Add Cat")

      fill_in("Name", with: "Spots")
      check
      fill_in("Lives", with: 8)
      click_button("Add Cat")
      
      expect(current_path).to eq("/grannies/#{granny_2.id}/cats")
      expect(page).to have_content("Spots")
      expect(page).to have_content(true)
      expect(page).to have_content(8)
        
    end
  end
end