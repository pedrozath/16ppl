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
      puts @questions.first.answer
      Personality.new *@questions.map(&:ask)
    end
  end
end