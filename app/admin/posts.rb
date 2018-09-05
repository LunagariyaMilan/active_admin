ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :description, :user_id, category_ids: []
#
# or
  index do
    selectable_column
    id_column
    column 'User' do |id|
      id.user.name
    end
    column :name
    column :description
    column 'Category' do |id|
      id.categories.collect(&:name).join(', ')
    end
    column :updated_at
    column :created_at
    actions
  end

  show do
    panel "Post Details" do
      attributes_table_for post do
        row :id
        row :name
        row :description
        row 'User' do |id|
          id.user.name
        end
        row 'Category' do |id|
          id.categories.collect(&:name).join(', ')
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all
      f.input :name
      f.input :description
      f.input :category_ids, as: :check_boxes, collection: Category.all, multiple: true
    end
      f.actions
  end
end
