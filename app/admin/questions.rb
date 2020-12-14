ActiveAdmin.register Question do

  actions :all, except:[:create, :update, :edit]

      permit_params :category_id, :body, :title, :config
      index do
        column :category
        actions
      end

      form partial: 'form'

    controller do

      def create
        @question = Question.create!(permitted_params[:question])
        case @question.category_id
        when Category.find_by(name: "checkbox").id
          render "admin/questions/checkbox/create.js.erb"
        when Category.find_by(name: "date_range").id
          render "admin/questions/date_range/create.js.erb"
        else
          render js: "window.location.href = '/admin/questions/#{@question.id}'"
        end
      end

      def update
        params.permit!
        question = Question.find(permitted_params[:id])
        question.update(params[:question])
        redirect_to admin_question_path(question.id)
      end
    end

end
