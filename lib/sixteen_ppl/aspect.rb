module SixteenPpl
  class Aspect
    attr_reader :name, :weight

    def initialize(name, weight)
      @name   = name
      @weight = weight
    end

    def inversion
      Aspect.new(name, -weight)
    end
  end
end