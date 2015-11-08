require 'units'

class TestUnits < Test::Unit::TestCase
  def setup
    @all = Units.all
    @mass = Units.of(:mass)
    @volume = Units.of(:volume)
    @length = Units.of(:length)
    @area = Units.of(:area)
  end

  def test_all
    test_collection_array_structure @all
    assert_equal(10, @all.size, 'Should have 10 elements')
  end

  def test_of_mass
    test_collection_array_structure @mass
    assert_equal(2, @mass.size, 'Should have 2 elements')
  end

  def test_of_volume
    test_collection_array_structure @volume
    assert_equal(2, @volume.size, 'Should have 2 elements')
  end

  def test_of_length
    test_collection_array_structure @length
    assert_equal(3, @length.size, 'Should have 3 elements')
  end

  def test_of_area
    test_collection_array_structure @area
    assert_equal(3, @area.size, 'Should have 3 elements')
  end

  def test_dimensions
    dimensions = Units.dimensions
    assert_equal(4, dimensions.size)
    assert(dimensions.is_a?(Array))
    assert(dimensions.include?(:mass))
    assert(dimensions.include?(:volume))
    assert(dimensions.include?(:length))
    assert(dimensions.include?(:area))
  end

  def test_dimension_of
    dimension = Units.dimension_of(:kg)
    assert_equal(:mass, dimension)
  end

  def test_convert
    quantity = Units.convert(2560, :g, :kg)
    assert_equal(2.560, quantity)
  end

  def test_convert_area
    quantity = Units.convert(2.0, :sqr_m, :sqr_cm)
    assert_equal(20_000.0, quantity)
  end

  def test_to_base_unit
    quantity = Units.to_base_unit(200, :g)
    assert_equal(0.2, quantity)
  end

  def test_base_unit_of
    assert_equal(Units.base_unit_of(:mass), :kg)
    assert_equal(Units.base_unit_of(:volume), :l)
    assert_equal(Units.base_unit_of(:length), :m)
    assert_equal(Units.base_unit_of(:area), :sqr_m)
  end

  def test_same_dimension?
    assert(Units.same_dimension?(:kg, :g))
  end

  def test_collection_array_structure(array)
    assert_equal(Array, array.class, 'Should be an Array object')

    array.each do |element|
      assert_equal(Symbol, element.class, 'Should be a Symbol object')
    end
  end

  def teardown
    @all = nil
    @mass = nil
    @length = nil
    @volume = nil
  end
end
