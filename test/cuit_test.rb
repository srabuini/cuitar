require 'test_helper'

class CuitTest < Minitest::Test
  def test_format
    assert_equal '20-22851831-0', Cuit.new('20228518310').to_s
  end

  def test_init_with_number
    assert_equal '20-22851831-0', Cuit.new(20228518310).to_s
  end

  def test_init_with_dashes
    assert_equal '20-22851831-0', Cuit.new('20-22851831-0').to_s
  end

  def test_raises_if_not_valid
    1.upto(9) do |i|
      assert_raises ArgumentError do
        refute Cuit.new("2022851831#{i}").valid?, i
      end
    end
  end

  def test_not_valid_for_lenght
    assert_raises ArgumentError do
      Cuit.new('202285183100').valid?
    end

    assert_raises ArgumentError do
      Cuit.new('202285183').valid?
    end
  end

  def test_not_valid_for_invalid_characters
    assert_raises ArgumentError do
      Cuit.new('2022851831a').to_s
    end
  end

  def test_valid?
    assert Cuit.valid?('20228518310')
  end

  def test_not_valid?
    refute Cuit.valid?('20228518311')
  end
end
