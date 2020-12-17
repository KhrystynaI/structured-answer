ActiveAdmin.register Category do
  permit_params :name, :params_config
  actions :all, except:[:create, :update, :edit]

  form partial: 'form'

  controller do

    def create
      params.permit!
      config = (params[:category][:params_config]).delete_if{|c|c.empty?}
      @category = Category.create!(name: permitted_params[:category][:name], params_config: config)
      FileUtils.mkdir_p Rails.root + "app/views/admin/questions/#{@category.name}"
      FileUtils.mkdir_p Rails.root + "app/views/admin/answers/#{@category.name}"
      File.open(Rails.root + "app/views/admin/questions/#{@category.name}/create.js.erb", 'w') { |file| file.write(
       %{$('#form').html('<%= escape_javascript(render partial: "admin/questions/#{@category.name}/form.html.erb") %>');}
       ) }
       File.open(Rails.root + "app/views/admin/questions/#{@category.name}/_form.html.erb", 'w') { |file| file.write(
        %{
          <%= semantic_form_for [:admin, @question], builder: ActiveAdmin::FormBuilder do |f|%>
          <%= f.inputs "Question Type" do%>
          <%= f.input :category, :input_html => { :readonly => true } %>
          <%=f.inputs name: 'Additional information', for: :config do |g|%>
          <%@question.for_form.each do |c|%>
          <%= g.input c.keys.first, as: c.values.first%>
          <%end%>
          <%end%>
          <%end%>
          <%= f.actions %>
          <%end%>
        }
        ) }
       File.open(Rails.root + "app/views/admin/answers/#{@category.name}/create.js.erb", 'w') { |file| file.write(
        %{$('#form').html('<%= escape_javascript(render partial: "admin/answers/#{@category.name}/form.html.erb") %>');}
        ) }
        File.open(Rails.root + "app/views/admin/answers/#{@category.name}/_form.html.erb", 'w') { |file| file.write(
         %{
           <%= semantic_form_for [:admin, @answer], builder: ActiveAdmin::FormBuilder do |f|%>
           <%= f.inputs "Question Type" do%>
           <%= f.input :question, :input_html => { :readonly => true } %>
           <%=f.inputs name: 'Additional information', for: :config do |g|%>
           <%@answer.question.for_form.each do |c|%>
           <%= g.input c.keys.first, as: c.values.first%>
           <%end%>
           <%end%>
           <%end%>
           <%= f.actions %>
           <%end%>
         }
         ) }
      redirect_to admin_category_path(@category.id)
    end

  end

end
