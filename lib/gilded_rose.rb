class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| update_item(item) }
  end

  private

  def update_item(item)
    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'

      if item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros'
        reduce_quality(item)
      end

    else

      if item.quality < 50
        increase_quality(item)
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            increase_quality(item)
          end
          if item.sell_in < 6
            increase_quality(item)
          end
        end
      end

    end

    item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'

    if item.sell_in < 0
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros'
            reduce_quality(item)
        else
          item.quality = 0
        end
      else
        increase_quality(item) if item.quality < 50
      end
    end
  end

  def check_name_(item)
    increase_quality if item.name == 'Aged Brie'
    item.quality if item.name == 'Sulfuras, Hand of Ragnaros'
    set_quality_bp(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def reduce_quality(item)
    item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end

  def set_quality_bp(item)
    increase_quality(item)
  end
end
