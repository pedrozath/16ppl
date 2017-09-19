module SixteenPpl
  class PersonalityFinder
    attr_reader :aspects, :personality, :questions, :type

    def initialize
      @questions = []
    end

    def add_question(*options)
      @questions << Question.new(*options)
    end

    def discover
      Personality.new *@questions.shuffle.map(&:ask)
    end
  end
end