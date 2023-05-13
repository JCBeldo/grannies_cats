require 'rails_helper'

RSpec.describe 'Grannies index page', type: :feature do
  let!(:granny_1) { Granny.create!(name: "Gretta", has_treats: true, age: 77) }
  let!(:granny_2) { Granny.create!(name: "Ethel", has_treats: true, age: 88) }
  let!(:granny_3) { Granny.create!(name: "Blanche", has_treats: false, age: 66) }

  describe 'displays the attributes of each granny' do
    it 'should display the name of each granny' do
      visit "/grannies"
        
      expect(page).to have_content("Gretta")
      expect(page).to have_content(granny_2.name)
      expect(page).to have_content(granny_3.name)
    end
  end

  describe 'displays records displayed in order by most recent' do
    it 'should display the grannies in descending order from recent to oldest' do
      visit "/grannies"

      expect("Blanche").to appear_before("Ethel")
      expect("Ethel").to appear_before("Gretta")
    end

    it 'shows the timestamp next to each granny record' do
      visit "/grannies"
      
      expect(page).to have_content(granny_3.created_at)
      expect(page).to have_content(granny_2.created_at)
      expect(page).to have_content(granny_1.created_at)
    end
  end

  describe 'displays a link to create a new granny and redirects back' do
    it 'should display a link to create a new granny and links to a new page' do
      visit "/grannies"

      expect(page).to have_link("New Granny")

      click_link("New Granny")

      expect(current_path).to eq("/grannies/new")
    end
  end

  describe 'displays a link to edit a granny' do
    it "should display a link to edit a granny's attritubtes" do
      visit"/grannies"
      
      expect(page).to have_link("Edit #{granny_1.name}")

      click_link("Edit #{granny_1.name}")

      expect(current_path).to eq("/grannies/#{granny_1.id}/edit")
      
    end
  end
end

#save_and_open_page
