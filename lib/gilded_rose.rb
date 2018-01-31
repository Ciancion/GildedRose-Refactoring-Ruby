
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > 0 && item.quality < 50
        set_item_quality(item)
      end
    end
  end

  private

  def set_item_quality(item)
    setup_item_quality(item)
    update_sell_in(item)
  end

### Set-up items quality
  def setup_item_quality(item)
    if normal_item?(item)
      reduce_quality(item)
    else
      increase_quality(item)
      setup_quality_backstage_passes(item)
    end
  end

### Set-up Backstage passes quality and sell_in
  def setup_quality_backstage_passes(item)
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      setup_backstage_passes_sell_in(item)
    end
  end

  def setup_backstage_passes_sell_in(item)
    if item.sell_in < 11
      increase_quality(item)
      set_backstage_passes_lower_5_days(item)
    end
  end

  def set_backstage_passes_lower_5_days(item)
    increase_quality(item) if item.sell_in < 6
  end

  def set_quality_expired_backstage_passes(item)
    item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

### Update Sell_in -- at the end of each day the system lowers both values for every item
  def update_sell_in(item)
    item.sell_in -= 1
    if expired?(item)
      setup_item_quality(item)
      set_quality_expired_backstage_passes(item)
    end
  end

### Quality proprieties
  def reduce_quality(item)
    item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end

### Sell_in Propriety
  def expired?(item)
    item.sell_in < 0
  end

### Item Propriety
  def normal_item?(item)
    item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
  end
end
