require 'spec_helper'

feature 'search results map', :js=>true do

  context 'results have entries that have coordinates', :vcr do
    it "displays a results list map" do
      visit('/organizations/')
      page.should have_selector("#map-view")
    end
  end

  context 'none of the results have coordinates', :vcr do
    it "does not display a results list map" do
      visit("/organizations?org_name=California+Coalition+for+Youth")
      page.should_not have_selector("#map-view")
    end
  end

end

feature 'nearby map', :js=>true do

  context 'location has coordinates', :vcr do
    it "displays a nearby map" do
      visit('/organizations/521d32b91974fcdb2b00001c')
      page.should have_selector("#detail-map-view")
    end
  end

  context 'location does not have coordinates', :vcr do
    it "does not display a nearby map" do
      visit('/organizations/521d33901974fcdb2b002581')
      page.should_not have_selector("#detail-map-view")
    end
  end

end