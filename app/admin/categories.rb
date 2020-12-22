ActiveAdmin.register Category do
  permit_params :name, :params_config
  actions :all, except:[:create, :update, :edit]

  form partial: 'form'

  controller do

    def create
      params.permit!
      config = (params[:category][:params_config]).delete_if{|c|c.empty?}
      @category = Category.create!(name: permitted_params[:category][:name], params_config: config)
      CreateViewsJob.perform_later(name: @category.name)
      redirect_to admin_category_path(@category.id)
    end


    after_destroy do |category|
    DeleteViewsJob.perform_later(name: category.name)
  end
  end

end
