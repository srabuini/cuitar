require 'test_helper'

class CuitTest < Minitest::Test
  def test_format
    assert_equal '20-22851831-0', Cuit.new('20228518310').to_s
  end

  def test_init_with_number
    assert_equal '20-22851831-0', Cuit.new(20228518310).to_s
  end

  def test_init_with_dashes
    assert Cuit.new('23-22029227-4').valid?
  end

  def test_valid?
    assert Cuit.new('20228518310').valid?
  end

  def test_not_valid?
    1.upto(9) do |i|
      refute Cuit.new("2022851831#{i}").valid?, i
    end
  end

  def test_not_valid_for_lenght
    refute Cuit.new('202285183100').valid?
    refute Cuit.new('202285183').valid?
  end
end
