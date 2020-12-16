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
        render @question.find_template
      end

      def update
        params.permit!
        question = Question.find(permitted_params[:id])
        question.update(params[:question])
        redirect_to admin_question_path(question.id)
      end
    end

end
