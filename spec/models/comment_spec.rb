require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do 
    @user = User.create!(email: "example@example.com",
                          password: "foobarfoobar")
    @article = @user.articles.create!(title: "One of many tales from a grand adventurer", 
                          entry: "Travelling to the center of the earth I saw wild crea...")
    @comment = @article.comments.create!(name: "Nameosa",
                          body: "This comment is my response.")
  end

  it "should create a valid comment" do 
    expect(@comment).to be_valid
  end

  it "should not create an invalid comment" do 
    @comment.name = ""
    expect(@comment).to be_invalid

    @comment.reload
    @comment.body = ""
    expect(@comment).to be_invalid
  end
end
