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

  describe 'Displays the cats that belong to each granny' do
    it 'should display each cats attributes that belong to granny by ID' do
      visit "/grannies/#{granny_1.id}/cats"
      
      expect(page).to have_content(cat_1.name)
      expect(page).to have_content(cat_2.name)
      expect(page).to have_content(cat_3.name)
      expect(page).to have_content(cat_3.lives)
      expect(page).to have_content(cat_2.spayed_neutered)
    end
  end
end

#save_and_open_page