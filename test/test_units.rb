require 'units'

class TestUnits < Test::Unit::TestCase
  def setup
    @all = Units.all
    @units = Units.of(:units)
    @mass = Units.of(:mass)
    @volume = Units.of(:volume)
    @length = Units.of(:length)
    @area = Units.of(:area)
  end

  def test_all
    test_collection_array_structure @all
    assert_equal(11, @all.size, 'Should have 11 elements')
  end

  def test_of_units
    test_collection_array_structure @units
    assert_equal(1, @units.size, 'Should have 1 element')
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
    assert_equal(5, dimensions.size)
    assert(dimensions.is_a?(Array))
    assert(dimensions.include?(:units))
    assert(dimensions.include?(:mass))
    assert(dimensions.include?(:volume))
    assert(dimensions.include?(:length))
    assert(dimensions.include?(:area))
  end

  def test_dimension_of
    dimension = Units.dimension_of(:kg)
    assert_equal(:mass, dimension)
  end

  def test_convert_mass_kilogram_to_gram
    quantity = Units.convert(2.560, :kg, :g)
    assert_equal(2560, quantity)
  end

  def test_convert_mass_gram_to_kilogram
    quantity = Units.convert(2560, :g, :kg)
    assert_equal(2.560, quantity)
  end

  def test_convert_volume_litter_to_milliliter
    quantity = Units.convert(2.560, :L, :ml)
    assert_equal(2560, quantity)
  end

  def test_convert_volume_milliliter_to_litter
    quantity = Units.convert(2560, :ml, :L)
    assert_equal(2.560, quantity)
  end

  def test_convert_length_meter_to_centimeter
    quantity = Units.convert(4.0, :m, :cm)
    assert_equal(400.0, quantity)
  end

  def test_convert_length_meter_to_millimiter
    quantity = Units.convert(4.0, :m, :mm)
    assert_equal(4000.0, quantity)
  end

  def test_convert_length_centimeter_to_meter
    quantity = Units.convert(4.0, :cm, :m)
    assert_equal(0.04, quantity)
  end

  def test_convert_length_centimeter_to_millimiter
    quantity = Units.convert(4.0, :cm, :mm)
    assert_equal(40.0, quantity)
  end

  def test_convert_length_millimiter_to_meter
    quantity = Units.convert(4.0, :mm, :m)
    assert_equal(0.004, quantity)
  end

  def test_convert_length_millimiter_to_centimeter
    quantity = Units.convert(4.0, :mm, :cm)
    assert_equal(0.4, quantity)
  end

  def test_convert_area_meter_to_centimeter
    quantity = Units.convert(4.0, :m2, :cm2)
    assert_equal(40_000.0, quantity)
  end

  def test_convert_area_meter_to_millimiter
    quantity = Units.convert(4.0, :m2, :mm2)
    assert_equal(4_000_000.0, quantity)
  end

  def test_convert_area_centimeter_to_meter
    quantity = Units.convert(4.0, :cm2, :m2)
    assert_equal(0.0004, quantity)
  end

  def test_convert_area_centimeter_to_millimiter
    quantity = Units.convert(4.0, :cm2, :mm2)
    assert_equal(400.0, quantity)
  end

  def test_convert_area_millimiter_to_meter
    quantity = Units.convert(4.0, :mm2, :m2)
    assert_equal(0.000004, quantity)
  end

  def test_convert_area_millimiter_to_centimeter
    quantity = Units.convert(4.0, :mm2, :cm2)
    assert_equal(0.04, quantity)
  end

  def test_to_base_unit
    quantity = Units.to_base_unit(200, :g)
    assert_equal(0.2, quantity)
  end

  def test_base_unit_of
    assert_equal(Units.base_unit_of(:units), :units)
    assert_equal(Units.base_unit_of(:mass), :kg)
    assert_equal(Units.base_unit_of(:volume), :L)
    assert_equal(Units.base_unit_of(:length), :m)
    assert_equal(Units.base_unit_of(:area), :m2)
  end

  def test_same_dimension?
    assert(Units.same_dimension?(:kg, :g))
    assert_equal(false, Units.same_dimension?(:kg, :L))
  end

  def test_collection_array_structure(array)
    assert_equal(Array, array.class, 'Should be an Array object')

    array.each do |element|
      assert_equal(Symbol, element.class, 'Should be a Symbol object')
    end
  end

  def teardown
    @all = nil
    @units = nil
    @mass = nil
    @length = nil
    @volume = nil
    @area = nil
  end
end
