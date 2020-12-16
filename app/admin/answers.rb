ActiveAdmin.register Answer do
  actions :all, except:[:create, :update, :edit]

      permit_params :question_id, :config
      index do
        column :question
        actions
      end

      form partial: 'form'

      controller do

        def create
          @answer = Answer.create!(permitted_params[:answer])
          render QuestionTypeHelper.render("answers",@answer.question.category.name)
        end

        def update
          params.permit!
          answer = Answer.find(permitted_params[:id])
          answer.update(params[:answer])
          redirect_to admin_answer_path(answer.id)
        end
      end

end
