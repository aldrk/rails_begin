module QustionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.title}"
    else
      "Create #{question.title}"
    end
  end
end
