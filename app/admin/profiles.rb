ActiveAdmin.register Profile do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :address, :mobile, role_ids: []

  index do
    selectable_column
    id_column
    column 'User' do |id|
      id.user.name
    end
    column 'Role' do |id|
      id.roles.collect(&:name).join(', ')
    end
    column :address
    column :mobile
    column :updated_at
    column :created_at
    actions
  end

  show do
    panel "Profile Details" do
      attributes_table_for profile do
        row :id
        row 'User' do |id|
          id.user.name
        end
        row 'Role' do |id|
          id.roles.collect(&:name).join(', ')
        end
        row :address
        row :mobile
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all
      f.input :address
      f.input :mobile
      f.input :role_ids, as: :check_boxes, collection: Role.all, multiple: true
    end
      f.actions
  end

end
