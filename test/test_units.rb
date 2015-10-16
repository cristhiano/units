require 'units'

class TestUnits < Test::Unit::TestCase
  def setup
    @all = Units.all
    @mass = Units.mass
    @length = Units.length
    @volume = Units.volume
  end

  def test_all
    test_collection_array_structure @all
    assert_equal(7, @all.size, 'Should have 7 elements')
  end

  def test_mass
    test_collection_array_structure @mass
    assert_equal(2, @mass.size, 'Should have 2 elements')
  end

  def test_length
    test_collection_array_structure @length
    assert_equal(3, @length.size, 'Should have 3 elements')
  end

  def test_volume
    test_collection_array_structure @volume
    assert_equal(2, @volume.size, 'Should have 2 elements')
  end

  def test_convert
    quantity = Units.convert(2560, :g, :kg)
    assert_equal(2.560, quantity)
  end

  def test_to_base_unit
    quantity = Units.to_base_unit(200, :g)
    assert_equal(0.2, quantity)
  end

  def test_same_dimension?
    assert(Units.same_dimension?(:kg, :g))
    assert(!Units.same_dimension?(:kg, :l))
  end

  def test_collection_array_structure(array)
    assert_equal(Array, array.class, 'Should be an Array object')

    array.each do |element|
      assert_equal(Array, element.class, 'Should be an Array object')

      assert_equal(2, element.size, 'Should have 2 elements')

      element.each do |member|
        assert_equal(String, member.class, 'Should be a String object')
      end
    end
  end

  def teardown
    @all = nil
    @mass = nil
    @length = nil
    @volume = nil
  end
end
