class Bob

  def hey(drivel)
    if silent?(drivel)
      'Fine. Be that way.'
    elsif question?(drivel)
      'Sure.'
    elsif shouting?(drivel)
      'Woah, chill out!'
    else
      'Whatever.'
    end
  end

  private

  def question?(s)
    s.end_with?('?')
  end

  def silent?(s)
    s.empty?
  end

  def shouting?(s)
    s.upcase == s
  end

end

class Alice

  def hey(drivel)
    answerer(drivel).reply
  end

  private

  def answerer(drivel)
    handlers.find {|answer| answer.handles?(drivel)}.new
  end

  def handlers
    [AnswerSilence, AnswerQuestion, AnswerShout, AnswerDefault]
  end

end

class AnswerSilence

  def self.handles?(input)
    input.empty?
  end

  def reply
    'Fine. Be that way.'
  end

end

class AnswerQuestion

  def self.handles?(input)
    input.end_with?('?')
  end

  def reply
    'Sure.'
  end

end

class AnswerShout

  def self.handles?(input)
    input == input.upcase
  end

  def reply
    'Woah, chill out!'
  end

end

class AnswerDefault

  def self.handles?(input)
    true
  end

  def reply
    'Whatever.'
  end

end

