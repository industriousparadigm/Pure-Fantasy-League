module SetBreadcrumbs
  extend ActiveSupport::Concern

  included do
    before_action :set_parent_breadcrumb
    before_action :set_collection_breadcrumb
    before_action :set_resource_breadcrumb, only: [:show, :edit, :update]
    before_action :set_create_breadcrumb, only: [:new, :create]
    before_action :set_update_breadcrumb, only: [:edit, :update]
  end


  def set_parent_breadcrumb
    if respond_to?(:parent?) && parent?
      add_breadcrumb parent.class.name.pluralize, [admin_scope, parent.class]
      add_breadcrumb parent, parent_path
    end
  end

  def set_collection_breadcrumb
    # if respond_to?(:collection)
      add_breadcrumb resource_class.name.pluralize, collection_path
    # end
  end

  def set_resource_breadcrumb
    add_breadcrumb resource, resource_path
  end

  def set_update_breadcrumb
    add_breadcrumb 'Editing...'
  end

  def set_create_breadcrumb
    add_breadcrumb 'Creating...'
  end
end
