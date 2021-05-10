class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new destroy create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_no_found

  def index
    render plain: @test.questions.pluck(:title)
  end

  def show
    render plain: Question.find(params[:id]).title
  end

  def new; end

  def create
    @question = @test.questions.build(test_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
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
