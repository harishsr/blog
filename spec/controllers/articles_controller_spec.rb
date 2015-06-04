require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  
  it "should get index" do 
    get :index
    expect(response).to be_success
  end

  it "should render index" do 
    get :index
    expect(response).to render_template('index')
  end

  it "should get new" do 
    get :new
    expect(response).to be_success
  end

  it "should render new" do 
    get :new
    expect(response).to render_template('new')
  end

  # it "should get edit"

  # it "should render edit"

  # it "should get show" 

  # it "should render show"

end
