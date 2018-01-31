class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > 0 && item.quality < 50
        item.sell_in -= 1
        item.update_quality_items
      end
    end
  end
end


  class Item
    attr_accessor :name, :sell_in, :quality

    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end

    def to_s()
      "#{@name}, #{@sell_in}, #{@quality}"
    end
  end


  class Normal < Item

    def update_quality_items
    @quality -= 1
    end
  end

  class AgedBrie < Item

    def update_quality_items
      @quality += 1
    end

  end

  class Backstage < Item
    def update_quality_items
      if expired?
        @quality = 0
      else
        @quality += 1
        setup_backstage_passes_sell_in
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
       if @sell_in < 6
         @quality += 1
       end
    end

    def expired?
      @sell_in < 0
    end
  end





  
