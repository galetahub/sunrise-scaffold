class Manage::<%= controller_class_name %>Controller < Manage::BaseController
  inherit_resources

  load_and_authorize_resource :class => <%= class_name %>
  
  has_scope :with_title, :as => :title, :only => :index
  order_by :created_at, :updated_at
  
  def create
    create!{ manage_<%= plural_name %>_path }
  end
  
  def update
    update!{ manage_<%= plural_name %>_path }
  end
  
  def destroy
    destroy!{ manage_<%= plural_name %>_path }
  end
  
  protected
    
    def collection
      @<%= plural_name %> = (@<%= plural_name %> || end_of_association_chain).order(search_filter.order).page(params[:page])
    end
end
