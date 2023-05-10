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

  describe 'displays the count of cats belonging to a granny' do
    it 'should display the number of cats that this particular granny has' do
      visit "/grannies/#{granny_1.id}"
      
      expect(page).to have_content("Number of Cats: 3")
    end
  end

  describe 'displays links to other pages' do
    it 'should display a link to the cats index' do
      visit "/grannies/#{granny_3.id}"

      expect(page).to have_link("All Cats")

      click_link("All Cats")

      expect(current_path).to eq("/cats")
    end
    
    it 'should display a link to the cats index' do
      visit "/grannies/#{granny_3.id}"
      
      expect(page).to have_link("All Grannies")

      click_link("All Grannies")

      expect(current_path).to eq("/grannies")
    end

    it 'should display a link to the grannies/cats index' do
      visit "/grannies/#{granny_3.id}"
      
      expect(page).to have_link("My Cats")
      
      click_link("My Cats")
      
      expect(current_path).to eq("/grannies/#{granny_3.id}/cats")
      
    end
  end
end