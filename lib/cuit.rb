class Cuit
  def initialize(cuit)
    @cuit = cuit.to_s.tr('^0-9', '')
  end

  def to_s
    [type, dni, check_digit].join('-')
  end

  def valid?
    @cuit.size == 11 && calculated_digit == check_digit
  end

  private

  def type
    @type ||= @cuit[0, 2]
  end

  def dni
    @dni ||= @cuit[2, 8]
  end

  def check_digit
    @check_digit ||= @cuit[-1].to_i
  end

  def cuit_sequence
    (type + dni).chars.map(&:to_i)
  end

  def calculated_digit
    sequence = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
    sum = sequence
          .zip(cuit_sequence)
          .reduce(0) { |a, e| a + e.reduce(:*) }

    diff = 11 - sum % 11

    diff == 11 ? 0 : diff
  end
end
