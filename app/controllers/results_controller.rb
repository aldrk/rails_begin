class ResultsController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed?
      redirect_to result_result_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end
end
