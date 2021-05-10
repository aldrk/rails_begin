class TestsController < ApplicationController
  def index
    render plain: Test.pluck(:title)
  end
end
