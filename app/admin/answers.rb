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
          case @answer.question.category_id
          when Category.find_by(name: Category::CATEGORIES_NAME[0]).id
            render "admin/answers/checkbox/create.js.erb"
          when Category.find_by(name: Category::CATEGORIES_NAME[1]).id
            render "admin/answers/date_range/create.js.erb"
          else
            render js: "window.location.href = '/admin/answers/#{@answer.id}'"
          end
        end

        def update
          params.permit!
          answer = Answer.find(permitted_params[:id])
          answer.update(params[:answer])
          redirect_to admin_answer_path(answer.id)
        end
      end

end
