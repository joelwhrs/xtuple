select private.create_model(

-- Model name, schema, table

'item_characteristic', '', 

-- table
'(select 
    charass_id,
    charass_target_type,
    charass_target_id,
    charass_char_id,
    charass_value,
    charass_default,
    charass_price,
    char_name,
    char_order
  from charass
   join char on charass_char_id=char_id) as charass',

-- Columns

E'{
  "charass.charass_id as guid",
  "charass.charass_target_id as item",
  "charass.charass_char_id as characteristic",
  "charass.charass_value as value",  
  "charass.charass_default as is_default",
  "charass.charass_price as price"}',

-- Rules

E'{"

-- insert rule

create or replace rule \\"_CREATE\\" as on insert to xm.item_characteristic
  do instead

insert into public.charass (
  charass_id,
  charass_target_id,
  charass_target_type,
  charass_char_id,
  charass_value,
  charass_default,
  charass_price )
values (
  new.guid,
  new.item,
  \'I\',
  new.characteristic,
  new.value,
  new.is_default,
  new.price );

","

-- update rule

create or replace rule \\"_UPDATE\\" as on update to xm.item_characteristic
  do instead

update public.charass set
  charass_char_id = new.characteristic,
  charass_value = new.value,
  charass_default = new.is_default,
  charass_price = new.price
where ( charass_id = old.guid );

","

-- delete rule

create or replace rule \\"_DELETE\\" as on delete to xm.item_characteristic
  do instead

delete from public.charass 
where ( charass_id = old.guid );

"}', 

-- Conditions, Order, Comment, System, Nested
E'{"charass_target_type=\'I\'"}', '{"charass.char_order","charass.char_name"}', 'Item Characteristic Model', true, true);
