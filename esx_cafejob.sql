INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_glacier', 'glacier', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_glacier', 'glacier', 1),
  ('society_glacier_fridge', 'glacier (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_glacier', 'glacier', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('glacier', 'Glacier', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('glacier', 0, 'apprenti', 'Apprenti Glacier', 100, '{}', '{}'),
  ('glacier', 1, 'barista', 'Glacier', 100, '{}', '{}'),
  ('glacier', 2, 'viceboss', 'Co-gérant', 100, '{}', '{}'),
  ('glacier', 3, 'boss', 'Gérant', 100, '{}', '{}')


INSERT INTO `items` (`name`, `label`, `weight`) VALUES  
    ('cremeglace', 'Crème glacée', 2),
    ('glacevanille', 'Glace vanille', 2),
    ('glacechoco', 'Glace chocolat', 1),
    ('glacefraise', 'Glace fraise', 1),
    ('glacecaramel', 'Glace caramel', 1),
    ('glacementhe', 'Glace menthe', 1),
    ('glacevermi', 'Glace vermicelle', 1),
    ('glacedouble', 'Glace Double boules', 1)
;