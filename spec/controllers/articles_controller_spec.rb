require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let!(:user) { User.create!(email: "email@example.com", password: "password1") }
  let!(:article) { Article.create!(title: "Just another day", 
                                    entry: "Another day another test made to pass.  ",
                                    user_id: 1)}

  context "Routing" do 
    it "should get index" do 
      get :index
      expect(response).to be_success
      expect(:get => "articles").to route_to(
        :controller => "articles",
        :action => "index"
      )
    end

    it "should get new" do 
      sign_in(user)
      get :new
      expect(response).to be_success
      expect(:get => "articles/new").to route_to(
        :controller => "articles",
        :action => "new"
      )
    end

    it "should get edit" do 
      sign_in(user)
      get :edit, id: article.id
      expect(response).to be_success
      expect(:get => "articles/1/edit").to route_to(
        :controller => "articles",
        :action => "edit",
        :id => "1"
      )
    end

    it "should get show" do 
      get :show, id: article.id
      expect(response).to be_success
      expect(get: "articles/1/").to route_to(
        controller: "articles",
        action: "show",
        id: "1"
        )
    end

    it "should route to update" do 
      expect(put: "articles/1/").to route_to(
        controller: "articles",
        action: "update",
        id: "1"
        )
    end

    it "should route to delete" do 
      expect(delete: "articles/1/").to route_to(
        controller: "articles",
        action: "destroy",
        id: "1")
    end
  end

  context "Rendering" do 
    it "should render index" do 
      get :index
      expect(response).to render_template('index')
    end

    it "should render new" do 
      sign_in(user)
      get :new
      expect(response).to render_template('new')
    end

    it "should render edit" do 
      sign_in(user)
      get :edit, id: article.id
      expect(response).to render_template('edit')
    end

    it "should render show" do
      get :show, id: article.id
      expect(response).to render_template('show')
    end
  end
end
