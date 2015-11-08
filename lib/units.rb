module Units
  UNITS = {
    kg:     { name: 'Kilogram',           dimension: :mass,   ratio: 1 },
    g:      { name: 'Gram',               dimension: :mass,   ratio: 0.001 },

    l:      { name: 'Litter',             dimension: :volume, ratio: 1 },
    ml:     { name: 'Milliliter',         dimension: :volume, ratio: 0.001 },

    m:      { name: 'Meter',              dimension: :length, ratio: 1 },
    cm:     { name: 'Centimeter',         dimension: :length, ratio: 0.01 },
    mm:     { name: 'Millimeter',         dimension: :length, ratio: 0.001 },

    sqr_m:  { name: 'Square Meter',       dimension: :area,   ratio: 1 },
    sqr_cm: { name: 'Square Centimeter',  dimension: :area,   ratio: 0.0001 },
    sqr_mm: { name: 'Square Millimeter',  dimension: :area,   ratio: 0.0000001 }
  }.freeze

  def self.all
    build_array UNITS
  end

  def self.of(dimension)
    build_array(select_units_of(dimension))
  end

  def self.dimensions
    UNITS.map { |_k, v| v[:dimension] }.uniq
  end

  def self.dimension_of(unit)
    unit = unit.to_sym
    UNITS[unit][:dimension]
  end

  def self.convert(quantity, from, to)
    from = from.to_sym
    to = to.to_sym

    if self.same_dimension?(from, to)
      to_base_unit(quantity, from) / UNITS[to][:ratio]
    end
  end

  def self.to_base_unit(quantity, unit)
    unit = unit.to_sym
    quantity * UNITS[unit][:ratio]
  end

  def self.base_unit_of(dimension)
    dimension = dimension.to_sym
    select_units_of(dimension).each do |k, v|
      return k if v[:ratio] == 1
    end
  end

  def self.same_dimension?(a, b)
    a = a.to_sym
    b = b.to_sym

    UNITS[a][:dimension] == UNITS[b][:dimension]
  end

  private

  def self.select_units_of(dimension)
    UNITS.select { |_k, v| v[:dimension] == dimension }
  end

  def self.build_array(params)
    params.map { |k, _v| k }
  end
end
