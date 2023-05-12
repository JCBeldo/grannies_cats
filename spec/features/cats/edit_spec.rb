# When I click the button to submit the form "Update Child"
# Then a PATCH request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

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

  describe 'displays a form to edit an exisiting cat' do
    it 'should display a form that edits an exisiting cat and redirects to the cat show page' do
      visit "/cats/#{cat_1.id}/edit"

      expect(page).to have_button("Update Cat")

      fill_in("Lives", with: 8)
      fill_in("spayed_neutered", with: true)
      click_button("Update Cat")

      expect(current_path).to eq("/cats/#{cat_1.id}")
      expect(page).to have_content(8)
      expect(page).to have_content(true)
       
    end
  end
end
