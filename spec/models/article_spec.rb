require 'rails_helper'

RSpec.describe Article, type: :model do

  before { @article = Article.create!(title: "Just another day", entry: "Another day another dollar earned.  200 times.  ")}
  
  context "validations" do 
    it "should validate a correct article" do 
      expect(@article).to be_valid
    end

    it "should require title be present" do 
      @article.title = ""
      expect(@article).to be_invalid
    end

    it "should require title be between 3 and 150 chars long" do 
      # Under 3 chars long
      @article.title = "Hi"
      expect(@article).to be_invalid

      # over 150 chars long
      @article.title = "a"*151
      expect(@article).to be_invalid
    end

    it "should require entry be present" do 
      @article.entry = ""
      expect(@article).to be_invalid
    end

    it "should require entry be between 15 & 5000 chars long" do 
      # Under 15 chars long
      @article.entry = "a"*14
      expect(@article).to be_invalid

      # Over 5000 chars long
      @article.entry = "a"*5001
      expect(@article).to be_invalid
    end
  end
end
