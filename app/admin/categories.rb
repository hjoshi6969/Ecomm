ActiveAdmin.register Category do
  permit_params :name

  member_action :delete_products, method: :delete do
    category = Category.find(params[:id])
    category.products.destroy_all
    redirect_to admin_categories_path, notice: 'All associated products have been deleted.'
  end

  action_item :delete_products, only: :show do
    category = Category.find(params[:id])  # Define category within the scope of the action_item block
    link_to 'Delete Associated Products', delete_products_admin_category_path(category), method: :delete, data: { confirm: 'Are you sure you want to delete all associated products?' }
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Category Details" do
      f.input :name
    end
    f.actions
  end
end
