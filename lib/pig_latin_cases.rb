require 'exercise_cases'

class PigLatinCase < OpenStruct
  def name
    'test_%s' % description.tr('- ', '__')
  end

  def workload
    %Q(assert_equal #{expected.inspect}, PigLatin.translate(#{input.inspect}))
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

PigLatinCases = proc do |data|
  cases = JSON.parse(data)['cases'].flat_map {|section| section['cases'] }
  cases.map.with_index {|test, i| PigLatinCase.new(test.merge('index' => i)) }
end
