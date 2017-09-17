module SixteenPpl
  class Personality
    attr_reader :type, :acronym

    CODE = {
      mind:     %w[I E],
      energy:   %w[S N],
      nature:   %w[T F],
      tactics:  %w[J P],
      identity: %w[-A -T]
    }

    BASIS = {
      mind: 0,
      energy: 0,
      nature: 0,
      tactics: 0,
      identity: 0
    }

    ROLES = {
      intj: "Architect",
      intp: "Logician",
      entj: "Commander",
      entp: "Debater",

      infj: "Advocate",
      infp: "Mediator",
      enfj: "Protagonist",
      enfp: "Campaigner",

      istj: "Logistician",
      isfj: "Defender",
      estj: "Executive",
      esfj: "Consul",

      istp: "Virtuoso",
      isfp: "Adventurer",
      estp: "Entrepeneur",
      esfp: "Entertainer",
    }

    STRATEGIES = [
      { matcher: /I\w\w\w-A/, name: 'Confident Individualism' },
      { matcher: /E\w\w\w-A/, name: 'People Mastery' },
      { matcher: /I\w\w\w-T/, name: 'Constant Improvement' },
      { matcher: /E\w\w\w-T/, name: 'Social Engagement' }
    ]

    def initialize(*answers)

      results   = BASIS.dup
      answers.each do |answer|
        #TODO implement aspect sum
        results[answer.aspect.name] += answer.aspect.weight
      end

      @type = get_type_from_results(results)
    end

    def get_type_from_results(results)
      acronym = []
      CODE.each do |aspect_name, letters|
        if results[aspect_name] < 0
          acronym << letters.first
        else
          acronym << letters.last
        end
      end
      @acronym = acronym.join
    end

    def to_s
      "#{@acronym} / #{role} with #{strategy}"
    end

    def role
      ROLES[:"#{acronym.downcase[0..3]}"]
    end

    def strategy
      STRATEGIES.select {|s| acronym =~ s[:matcher]}.first[:name]
    end
  end
end