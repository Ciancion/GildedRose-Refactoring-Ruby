class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update_quality_items)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class Normal < Item
  def update_quality_items
    if @quality > 0 && @quality < 50
      @sell_in -= 1
      @quality -= 1
    end
  end
end

class Sulfuras < Item
  def update_quality_items
    if @quality > 0 && @quality < 50
      @sell_in -= 1
      @quality
    end
  end
end

class AgedBrie < Item
  def update_quality_items
    if @quality > 0 && @quality < 50
      @sell_in -= 1
      @quality += 1
    end
  end
end

class Backstage < Item
  def update_quality_items
    if @quality > 0 && @quality < 50
      @sell_in -= 1
      if expired?
        @quality = 0
      else
        @quality += 1
        setup_backstage_passes_sell_in
      end
    end
  end

  private

  def setup_backstage_passes_sell_in
    if @sell_in < 11
      @quality += 1
      set_backstage_passes_lower_5_days
    end
  end

  def set_backstage_passes_lower_5_days
    @quality += 1 if @sell_in < 6
  end

  def expired?
    @sell_in < 0
  end
end
