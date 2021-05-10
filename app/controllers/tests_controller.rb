class TestsController < ApplicationController
  def index
    render plain: Test.all.pluck(:title)
  end
end
