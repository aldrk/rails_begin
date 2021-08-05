class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit destroy update show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_no_found

  def show; end

  def edit; end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_no_found
    render plain: 'Question not found'
  end
end
