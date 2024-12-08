# What is each pokemon's primary type?
 SELECT p.name, pt.name AS primary_type_name, st.name AS secondary_type_name FROM pokemons p LEFT JOIN types pt ON p.primary_type = pt.id LEFT JOIN types st ON p.secondary_type = st.id;


# What is Rufflet's secondary type?
SELECT
    p.name, t.name AS secondary_type_name FROM pokemons p LEFT JOIN types t ON p.secondary_type = t.id WHERE p.name = 'Rufflet';

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name FROM pokemons p JOIN pokemon_trainer pt ON p.id = pt.pokemon_id WHERE pt.trainerID = 303;

# How many pokemon have a secondary type Poison
SELECT COUNT(*) AS num_pokemon_with_poison_secondary FROM pokemons p JOIN types t ON p.secondary_type = t.id WHERE t.name = 'Poison';

# What are all the primary types and how many pokemon have that type?
SELECT t.name AS primary_type, COUNT(p.id) AS num_pokemon FROM pokemons p JOIN types t ON p.primary_type = t.id GROUP BY t.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
 SELECT pt.trainerID, COUNT(pt.pokemon_id) AS num_level_100_pokemon FROM pokemon_trainer pt WHERE pt.pokelevel = 100 GROUP BY pt.trainerID HAVING COUNT(pt.pokemon_id) > 0;


# How many pokemon only belong to one trainer and no other?
SELECT COUNT(*) AS num_pokemon_with_one_trainer FROM pokemon_trainer pt GROUP BY pt.pokemon_id HAVING COUNT(DISTINCT pt.trainerID) = 1;

