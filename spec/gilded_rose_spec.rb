# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'
require 'item'

describe GildedRose do
  context '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality

      expect(items[0].name).to eq 'foo'
    end
  end

  it'does degrade the quality twice when Sell by date is passed' do
    items = [Item.new('foo', 1, 5)]
    GildedRose.new(items).update_quality

    expect(items[0].quality).to eq(4)
  end

  context '#Aged Brie' do
    it 'increases the quality of Age Brie the older it gets' do
      items = [Item.new('Aged Brie', 1, 5)]
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq(6)
    end
  end

  context '#Sulfuras, Hand of Ragnaros' do
    it 'does not decrese the quality of Sulfuras' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 1, 5)]
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq(5)
    end
  end

  context '#Backstage passes to a TAFKAL80ETC concert' do
    it 'increases the quality of 2 when sell_in value approuches to 10 days or less' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)]
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq(7)
    end
  end

  it 'increases the quality of 3 when sell_in value approuches to 10 days or less' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 5)]
    GildedRose.new(items).update_quality

    expect(items[0].quality).to eq(8)
  end

  it 'does not increase the quality when sell_in value approuches to 10 days or less' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 5)]
    GildedRose.new(items).update_quality

    expect(items[0].quality).to eq(0)
  end

  context '#item' do
    it 'should not have an item with negative quality' do
      items = [Item.new('hello', 1, 0)]
      GildedRose.new(items).update_quality

      expect(items[0].quality).to be(0)
    end
  end

  it 'has items which never have quality greater than 50' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 50)]
    GildedRose.new(items).update_quality

    expect(items[0].quality).to be(50)
  end


end
