class GistQuestionService
  def initialize(question)
    @question = question
    @test = question.test
    @client = http_client
  end

  def call
    response = @client.create_gist(gist_params)
    ResponseObject.new(response.html_url.present?, response.html_url)
  end

  def http_client
    Octokit::Client.new(access_token: Rails.application.credentials.github[:access_token])
  end

  private

  def gist_params
    {
      description: I18n.t('gist.description', test: @test.title, question: @question.title),
      files: {
        I18n.t('gist.file_name') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end