ActiveAdmin.register Category do
  permit_params :name
    actions :index, :show

end
