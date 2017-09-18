module SixteenPpl
  class Trait
    attr_reader :aspect, :polarity

    TRAITS = {
      mind:     [:introvert, :extravert],
      energy:   [:observant, :intuitive],
      nature:   [:thinking,  :feeling],
      tactics:  [:judging,   :prospecting],
      identity: [:assertive, :turbulent],
    }

    def initialize(aspect, polarity)
      @aspect   = aspect
      @polarity = polarity
    end

    def self.[](trait)
      aspect   = get_aspect(trait)
      polarity = aspect.values.first.index(trait) < 1 ? -1 : +1

      Trait.new aspect.keys.first, polarity
    end


    private

    def self.get_aspect(trait)
      TRAITS.select { |aspect, traits| traits.include? trait }
    end

  end
end