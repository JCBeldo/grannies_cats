require 'rails_helper'

RSpec.describe 'Cats show page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }
  let!(:cat_1) { granny_1.cats.create!(name: "Snuffles", spayed_neutered: true, lives: 9) }
  let!(:cat_2) { granny_1.cats.create!(name: "Poopykins", spayed_neutered: true, lives: 9) }
  let!(:cat_3) { granny_1.cats.create!(name: "Sillyfluff", spayed_neutered: true, lives: 7) }
  let!(:cat_4) { granny_2.cats.create!(name: "Mr. Wiskers", spayed_neutered: false, lives: 6) }
  let!(:cat_5) { granny_3.cats.create!(name: "DingPu", spayed_neutered: true, lives: 9) }

  describe 'displays a specific cat and their attributes' do
    it 'should display the attributes of a particular cat' do
      visit "cats/#{cat_1.id}"
      
      expect(page).to have_content(cat_1.name)
      expect(page).to have_content(cat_1.spayed_neutered)
      expect(page).to have_content(cat_1.lives)
      expect(page).to_not have_content(cat_3.lives)
      expect(page).to_not have_content(cat_2.name)
      expect(page).to_not have_content(cat_3.name)
    end
  end

  describe 'displays a link to update this cat and redirects to an edit page' do
    it 'should display a link to update the attributes of this cat' do
      visit "/cats/#{cat_1.id}"

      expect(page).to have_link("Update Cat")

      click_link("Update Cat")

      expect(current_path).to eq("/cats/#{cat_1.id}/edit")
    end
  end
  
  describe 'displays a delete button to remove a cat record' do
    it 'should display a button to delete each particular cat' do
      visit "/cats/#{cat_2.id}"
      
      expect(page).to have_button("Delete #{cat_2.name}")
      expect(page).to_not have_button("Delete #{cat_1.name}")

      click_button("Delete #{cat_2.name}")

      expect(current_path).to eq("/cats")
      expect(page).to_not have_content(cat_2.name)

    end
  end
end