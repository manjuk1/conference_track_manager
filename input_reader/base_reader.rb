class BaseReader

  LIGHTNING_MINUTES = 5

  attr_reader :input_file

  def initialize(input_file)
    @input_file = input_file
  end

  private

  def lightning
    LIGHTNING_MINUTES
  end

end