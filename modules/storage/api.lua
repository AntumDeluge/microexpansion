-- storage/api.lua

local BASENAME = "microexpansion"

-- [function] register cell
function microexpansion.register_cell(itemstring, def)
  if not def.inventory_image then
    def.inventory_image = itemstring
  end

  -- register craftitem
  minetest.register_craftitem(BASENAME..":"..itemstring, {
    description = def.description,
    inventory_image = BASENAME.."_"..def.inventory_image..".png",
    groups = {microexpansion_cell = 1},
    microexpansion = {
      drive = {
        capacity = def.capacity or 5000,
      },
    },
  })

  -- if recipe, register recipe
  if def.recipe then
    -- if recipe, register recipe
    if def.recipe then
      register_recipe(BASENAME..":"..itemstring, def.recipe)
    end
  end
end

-- [function] Get cell size
function microexpansion.get_cell_size(name)
  local item = minetest.registered_craftitems[name]
  if item then
    return item.microexpansion.drive.capacity
  end
end

-- [function] Calculate max stacks
function microexpansion.int_to_stacks(int)
  return math.floor(int / 99)
end

-- [function] Calculate number of pages
function microexpansion.int_to_pagenum(int)
  return math.floor(microexpansion.int_to_stacks(int) / 32)
end

-- [function] Move items from inv to inv
function microexpansion.move_inv(inv1, inv2)
  local finv, tinv   = inv1.inv, inv2.inv
  local fname, tname = inv1.name, inv2.name

  for i,v in ipairs(finv:get_list(fname) or {}) do
    if tinv and tinv:room_for_item(tname, v) then
      local leftover = tinv:add_item( tname, v )
      finv:remove_item(fname, v)
      if leftover and not(leftover:is_empty()) then
        finv:add_item(fname, v)
      end
    end
  end
end
