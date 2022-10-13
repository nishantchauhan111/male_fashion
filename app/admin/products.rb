ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :category_id, :detail, :images , :mrp, :discount, :discount_type, :price, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :category_id, :detail, :image, :mrp, :discount, :discount_type, :price, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  filter :category_id
  filter :detail
  filter :mrp
  filter :discount
  filter :discount_type
  filter :price
  filter :active



  form do |f|
    f.inputs do 
    f.file_field :images 
    f.input :name
    f.input :category_id
    f.input :detail
    f.input :mrp
    f.input :discount
    f.input :discount_type
    f.input :price
    f.input :active
    


    end
    f.actions 
  end
  
end
