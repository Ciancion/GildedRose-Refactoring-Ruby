class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > 0 && item.quality < 50
        update_item(item)
      end
    end
  end

  private

  def update_item(item)
    if normal_item?(item)
      reduce_quality(item)
    else
      increase_quality(item)
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6
      end
    end

    item.sell_in = item.sell_in - 1

    if item.sell_in < 0
      if normal_item?(item)
        reduce_quality(item)
      else
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = 0
        else
          increase_quality(item)
        end
      end
    end
  end

  #move final logic in here
  def set_item_quality(item)
    if item.name == 'Aged Brie'
      increase_quality(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      set_quality_bp(item)
    else
      reduce_quality(item)
    end
  end

  def reduce_quality(item)
    item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end


  def normal_item?(item)
    item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
  end
end
