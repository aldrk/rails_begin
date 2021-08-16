module ResultsHelper
  def questions_counter(test_passage)
    "Question #{current_question_number}/#{test_passage.test.questions.count}"
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end
end
