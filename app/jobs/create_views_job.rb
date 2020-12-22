class CreateViewsJob < ApplicationJob
  queue_as :default

  def perform(args)
    name = args[:name]
    FileUtils.mkdir_p Rails.root + "app/views/admin/questions/#{name}"
    FileUtils.mkdir_p Rails.root + "app/views/admin/answers/#{name}"
    File.open(Rails.root + "app/views/admin/questions/#{name}/create.js.erb", 'w') { |file| file.write(
     %{$('#form').html('<%= escape_javascript(render partial: "admin/questions/#{name}/form.html.erb") %>');}
     ) }
     File.open(Rails.root + "app/views/admin/questions/#{name}/_form.html.erb", 'w') { |file| file.write(
       question_view
      ) }
     File.open(Rails.root + "app/views/admin/answers/#{name}/create.js.erb", 'w') { |file| file.write(
      %{$('#form').html('<%= escape_javascript(render partial: "admin/answers/#{name}/form.html.erb") %>');}
      ) }
      File.open(Rails.root + "app/views/admin/answers/#{name}/_form.html.erb", 'w') { |file| file.write(
        answer_view
       ) }
  end

  def question_view
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
  end

  def answer_view
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
  end
end
