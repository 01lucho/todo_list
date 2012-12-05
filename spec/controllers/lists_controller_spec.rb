require 'spec_helper'

describe ListsController do 

	it "should be able to create a new list and be redirect to index" do
    expect { 
      post :create, {:list => attributes_for(:list)}
      created_list = assigns[:list]
      created_list.should_not be_new_record
      response.should redirect_to(lists_url)
    }.to change { List.count }.by(1)
  end
  
  it "should be able to submit an update for an existing list" do
    existing_list = create(:list)
    put :update, id: existing_list.id
    response.should redirect_to(lists_url)
  end
	
  it "should be able to delete for an existing list" do
    existing_list = create(:list)
    delete :destroy, id: existing_list.id
    response.should redirect_to(lists_url)
  end

  it "should be presented with a list of all works at index" do
    4.times { create(:list) }
    get :index
    assigns[:incomplete_lists].should have_at_least(0).lists
    assigns[:complete_lists].should have_at_least(4).lists
    response.should render_template(:index)
  end

  it "should be able to see the option new work" do
    get :new
    response.should render_template(:new)
  end
end