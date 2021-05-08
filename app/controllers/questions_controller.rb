class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show new destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_no_found

  def index
    render plain: @test.questions.all.pluck(:title)
  end

  def show
    render plain: Question.find(params[:id]).title
  end

  def new
  end

  def create
    question = Question.create(test_params)

    render plain: "Create question with id: #{question.id}, title: #{question.title}"
  end

  def destroy
    Question.destroy(@test.id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_params
    params.require(:question).permit(:title, :test_id)
  end

  def rescue_with_no_found
    render plain: 'Question not found'
  end
end
