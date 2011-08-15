require 'spec_helper'

describe Manage::<%= controller_class_name %>Controller do
  render_views
  
  context "administrator" do
    login_admin
    
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:<%= singular_name %>)
    end
    
    it "should render new action" do
      get :new
      response.should be_success
      response.should render_template("new")
    end
    
    it "should create new <%= singular_name %>" do
      lambda {
        post :create, :<%= singular_name %> => @attrs
      }.should change { <%= class_name %>.count }.by(1)
    end
    
    context "exists default <%= singular_name %>" do
      before(:each) do
        @<%= singular_name %> = FactoryGirl.create(:<%= singular_name %>)
      end
      
      it "should render index action" do
        get :index
        assigns(:<%= plural_name %>).should include(@<%= singular_name %>)
        response.should render_template('index')
      end
      
      it "should render edit action" do
        controller.should_receive :edit
        get :edit, :id => @<%= singular_name %>.id
      end
      
      it "should update <%= singular_name %>" do
        put :update, :id => @<%= singular_name %>.id, :<%= singular_name %> => @attrs
        assigns(:<%= singular_name %>).should be_valid
        response.should redirect_to(manage_<%= plural_name %>_path)
      end
      
      it "should destroy <%= singular_name %>" do
        lambda {
          delete :destroy, :id => @<%= singular_name %>.id
        }.should change { <%= class_name %>.count }.by(-1)
      end
    end
  end
  
  context "anonymous user" do
    user_logout
    
    it "should not render index action" do
      controller.should_not_receive :index
      get :index
    end
    
    it "should not render new action" do
      controller.should_not_receive :new
      get :new
    end
    
    it "should not render create action" do
      controller.should_not_receive :create
      post :create
    end
    
    context "with exists <%= singular_name %>" do
      before(:each) do
        @<%= singular_name %> = FactoryGirl.create(:<%= singular_name %>)
      end
      
      it "should not render edit action" do
        controller.should_not_receive :edit
        get :edit, :id => @<%= singular_name %>.id
      end
      
      it "should not render update action" do
        controller.should_not_receive :update
        put :update, :id => @<%= singular_name %>.id
      end
      
      it "should not render destroy action" do
        controller.should_not_receive :destroy
        delete :destroy, :id => @<%= singular_name %>.id
      end
    end
  end
end
