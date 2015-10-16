module Units
  UNITS = {
    kg: { name: 'Kilogram',      dimension: :mass,        ratio: 1 },
    g:  { name: 'Gram',          dimension: :mass,        ratio: 0.001 },

    m:  { name: 'Meter',         dimension: :length,      ratio: 1 },
    cm: { name: 'Centimeter',    dimension: :length,      ratio: 0.01 },
    mm: { name: 'Millimeter',    dimension: :length,      ratio: 0.001 },

    l:  { name: 'Litter',        dimension: :volume,      ratio: 1 },
    ml: { name: 'Milliliter',    dimension: :volume,      ratio: 0.001 },
  }.freeze

  def self.all
    build_array UNITS
  end

  def self.mass
    build_array(select_units_of(:mass))
  end

  def self.length
    build_array(select_units_of(:length))
  end

  def self.volume
    build_array(select_units_of(:volume))
  end

  def self.convert(quantity, from, to)
    if self.same_dimension?(from, to)
      to_base_unit(quantity, from) / UNITS[to][:ratio]
    end
  end

  def self.to_base_unit(quantity, unit)
    quantity * UNITS[unit][:ratio]
  end

  def self.same_dimension?(a, b)
    UNITS[a][:dimension] == UNITS[b][:dimension]
  end

  private
    def self.select_units_of dimension
      UNITS.select { |k,v| v[:dimension] == dimension }
    end

    def self.build_array params
      params.map { |k,v| [v[:name], k.to_s] }
    end
end
