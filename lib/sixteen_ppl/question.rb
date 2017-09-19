module SixteenPpl
  class Question
    attr_reader :aspect, :sentence, :answer, :weight, :type

    def initialize(trait, type, sentence)
      @aspect   = Aspect.new(trait.aspect, trait.polarity)
      @type     = type
      @sentence = sentence
      @weight   = trait.polarity
    end

    def ask
      puts "#{sentence} [s/n]"
      @answer = Answer.new(aspect, gets)
    end
  end
end