module SixteenPpl
  class Answer
    attr_reader :aspect_name, :aspect

    def initialize(aspect, user_input)
      @aspect_name = aspect
      @aspect      = user_input =~ /s/ ? aspect : aspect.inversion
    end
  end
end