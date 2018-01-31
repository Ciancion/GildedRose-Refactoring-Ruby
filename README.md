# GildedRose-Refactoring-Ruby - Tech TestCase

The aim of this Tech test is to refactoring a code  difficult to read and to understand.

## GildedRose Requirements Specifications

Simple requirements:

-- All items have a SellIn value which denotes the number of days we have to sell the item
	-- All items have a Quality value which denotes how valuable the item is
	-- At the end of each day our system lowers both values for every item

More complex requirements:

	-- Once the sell by date has passed, Quality degrades twice as fast
	-- The Quality of an item is never negative
	-- "Aged Brie" actually increases in Quality the older it gets
	-- The Quality of an item is never more than 50
	-- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	-- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert
