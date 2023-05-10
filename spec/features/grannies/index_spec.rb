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
end

#save_and_open_page