
-- IN013 HW 4: TASK 2 Umar 

-- 1. Insert event for Fluffy on 2020-10-15
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics");
-- 2. Insert Hammy and a vet visit event for 2020-10-15
INSERT INTO petPet VALUES ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);
INSERT INTO petEvent VALUES ("Hammy", "2020-10-15", "vet", "antibiotics");
-- 3. Insert Fluffy's litter event with an approximate date and remark
-- It showed to me that Fluffy had 5 kittens and 2 were the male oes.
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "litter", "5 kittens, 3 female, 2 male");
-- 4. Correct Slim’s broken rib event to Claws
UPDATE petEvent SET petname = "Claws" WHERE eventdate = "1997-08-03" AND remark = "broken rib";
-- 5. Mark Puffball’s death on 2020-09-01
UPDATE petPet SET death = "2020-09-01" WHERE petname = "Puffball";
-- 6. Update foreign key for cascading deletion, then delete Harold's dog data because of the GDRP
ALTER TABLE petEvent DROP FOREIGN KEY petevent_ibfk_1;
-- adding the new one with the wanted cascade constraint option. 
ALTER TABLE petEvent ADD CONSTRAINT fk_petname FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE;
-- Remove Harolds dog 
DELETE FROM petPet WHERE owner = "Harold" AND species = "dog";
