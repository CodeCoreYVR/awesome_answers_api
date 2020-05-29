class Api::V1::QuestionsController < Api::ApplicationController
  def index
    questions = Question.order(created_at: :desc)
    render(json: questions, each_serializer: QuestionCollectionSerializer)
  end

  def show
    question = Question.find(params[:id])
    render(json: question)
  end

  # no need for new
  # def new
  # end

  def create
    question = Question.new params.require(:question).permit(:title, :body, :tag_names)
    question.user = current_user
    if question.save
      render(json: { id: question.id })
    else
      render(
        json: { errors: question.errors },
        status: 422 # unprocessable entity HTTP Status Code
      )
    end
  end
  
  # No need for edit
  # def edit
  # end

  def delete
  end
end
