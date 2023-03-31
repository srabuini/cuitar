class Cuit
  def self.valid?(cuit)
    begin
      new(cuit)
    rescue
      false
    end
  end

  def initialize(cuit)
    @cuit = cuit.to_s.gsub(/\D/, '')

    raise ArgumentError, 'Invalid CUIT' unless valid?
  end

  def to_s
    [type, dni, check_digit].join('-')
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

    diff = 11 - (sum % 11)

    diff == 11 ? 0 : diff
  end

  def right_length?
    @cuit.length == 11
  end

  def checked?
    calculated_digit == check_digit
  end

  def valid?
    right_length? && checked?
  end
end
