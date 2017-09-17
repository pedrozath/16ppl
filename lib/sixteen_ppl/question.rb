module SixteenPpl
  class Question
    attr_reader :aspect, :sentence, :answer, :weight

    def initialize(aspect_name, weight, sentence)
      @aspect   = Aspect.new(aspect_name, weight)
      @sentence = sentence
      @weight   = weight
    end

    def ask
      puts "#{sentence} [s/n]"
      @answer = Answer.new(aspect, gets)
    end
  end
end