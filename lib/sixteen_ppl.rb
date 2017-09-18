require 'yaml'
require 'rubygems'
require 'bundler'

Bundler.setup

require_relative 'sixteen_ppl/trait'
require_relative 'sixteen_ppl/aspect'
require_relative 'sixteen_ppl/question'
require_relative 'sixteen_ppl/answer'
require_relative 'sixteen_ppl/personality'
require_relative 'sixteen_ppl/personality_finder'

personality_finder = SixteenPpl::PersonalityFinder.new

YAML.load_file('config/questions.yml').each do |trait, question_category|
  question_category.each do |category_name, questions|
    questions.each do |question|
      personality_finder
        .add_question SixteenPpl::Trait[trait.to_sym], question
    end
  end
end

puts personality_finder.discover