class Manage::<%= controller_class_name %>Controller < Manage::BaseController
  inherit_resources
  belongs_to :<%= parent_singular_name %>
  
  load_and_authorize_resource :<%= singular_name %>, :through => :<%= parent_singular_name %>
  
  has_scope :with_title, :as => :title, :only => :index
  order_by :created_at, :updated_at
  
  def create
    create!{ manage_<%= parent_singular_name %>_<%= plural_name %>_path(@<%= parent_singular_name %>.id) }
  end
  
  def update
    update!{ manage_<%= parent_singular_name %>_<%= plural_name %>_path(@<%= parent_singular_name %>.id) }
  end
  
  def destroy
    destroy!{ manage_<%= parent_singular_name %>_<%= plural_name %>_path(@<%= parent_singular_name %>.id) }
  end
  
  protected
    
    def begin_of_association_chain
      @<%= parent_singular_name %>
    end
    
    def collection
      @<%= plural_name %> = (@<%= plural_name %> || end_of_association_chain).order(search_filter.order).page(params[:page])
    end
end
