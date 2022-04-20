require_relative 'base_decorator'

class CaptalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
