--  How many items are there with an item_category of 'Snack' and an item_subcategory of 'Warm Option'?

--select count(*)
--from menu
--where ITEM_CATEGORY = 'Snack' and item_subcategory = 'Warm Option'

-- What are the max sales prices for each of the three item subcategories (hot option, warm option, cold option)? List from highest price to lowest.
select item_subcategory, max(sale_price_usd)
from menu
group by item_subcategory
