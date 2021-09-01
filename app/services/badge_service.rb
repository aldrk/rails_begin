class BadgeService
  def initialize(result)
    @result = result
    @test = result.test
    @user = result.user
    @badges = Badge.all

    current_result
  end

  def call
    @badges.select { |badge| send(badge.condition, badge.condition_value) }
  end

  private

  def current_result
    @current_result = @user.results.where(test: @test)
  end

  def all_tests_in_category_passed(category)
    return false unless @test.category.title == category

    Test.tests_by(category).ids.size == count_tests_success(test_ids)
  end

  def first_try_passed(_args)
    @current_result.count == 1 if @result.success_result?
  end

  def all_level_tests_passed(level)
    return false unless @test.level == level.to_i

    test_ids = Test.where(level: level).ids
    test_ids.size == count_tests_success(test_ids)
  end

  def count_tests_success(test_ids)
    @user.results.where(test_id: test_ids).success_results.uniq.count
  end
end