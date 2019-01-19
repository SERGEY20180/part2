require 'rails_helper'
  describe Page do
    it "is valid with a title, string" do
      page = Page.new(
        title: 'First title',
        string: 'First string')
      expect(page).to be_valid
    end
    it "is invalid without a title" do
      page = Page.new(title: nil)
      page.valid?
      expect(page.errors[:title]).to include("can't be blank")	
    end
  end 
