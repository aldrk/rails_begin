class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new destroy create]
  before_action :find_question, only: show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_no_found

  def index
    render plain: @test.questions.pluck(:title)
  end

  def show
    render plain: @question.title
  end

  def new; end

  def create
    question = @test.questions.build(test_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to @test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = Question.find(params[:test_id])
  end

  def rescue_with_no_found
    render plain: 'Question not found'
  end
end
