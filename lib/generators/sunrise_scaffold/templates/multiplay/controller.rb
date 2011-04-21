class Manage::<%= controller_class_name %>Controller < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage'  
  belongs_to :<%= parent_singular_name %>
  
  before_filter :make_filter, :only=>[:index]
  
  load_and_authorize_resource :<%= singular_name %>, :through => :<%= parent_singular_name %>
  
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
      @<%= plural_name %> = (@<%= plural_name %> || end_of_association_chain).merge(@search.scoped).page(params[:page])
    end
    
    def make_filter
      @search = Sunrise::ModelFilter.new(<%= model_name %>, :attributes=>[ <%= model.attributes.keys.map{ |a| ":#{a}" }.join(', ') %> ] )
      @search.update_attributes(params[:search])
    end
end
