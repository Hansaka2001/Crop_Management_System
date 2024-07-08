% Facts about different crop types
crop_type(wheat).
crop_type(rice).
crop_type(corn).
crop_type(potato).
crop_type(tomato).
crop_type(soybean).
crop_type(barley).
crop_type(oats).
crop_type(sunflower).
crop_type(cotton).

% Facts about different soil types
soil_type(clay).
soil_type(sandy).
soil_type(loam).
soil_type(silt).
soil_type(peat).
soil_type(chalky).
soil_type(saline).
soil_type(alluvial).

% Facts about different types of fertilizers
fertilizer(nitrogen).
fertilizer(phosphorus).
fertilizer(potassium).
fertilizer(calcium).
fertilizer(magnesium).
fertilizer(sulfur).
fertilizer(iron).
fertilizer(manganese).
fertilizer(boron).
fertilizer(zinc).


% Facts about growth stages for each crop
crop_growth_stage(wheat, [germination, tillering, stem_elongation, booting, heading, flowering, grain_filling, ripening]).
crop_growth_stage(rice, [germination, seedling, tillering, stem_elongation, panicle_initiation, heading, flowering, milk_stage, dough_stage, mature_grain]).
crop_growth_stage(corn, [germination, seedling, vegetative, tasseling, silking, blister, milk, dough, dent, physiological_maturity]).
crop_growth_stage(potato, [sprout_development, vegetative_growth, tuber_initiation, tuber_bulking, maturation]).
crop_growth_stage(tomato, [germination, vegetative_growth, flowering, fruit_set, fruit_development, ripening]).
crop_growth_stage(soybean, [emergence, vegetative, flowering, pod_development, seed_filling, maturation]).
crop_growth_stage(barley, [germination, seedling, tillering, stem_extension, booting, heading, flowering, grain_filling, ripening]).
crop_growth_stage(oats, [germination, seedling, tillering, stem_extension, booting, heading, flowering, grain_filling, ripening]).
crop_growth_stage(sunflower, [germination, vegetative, bud, flowering, seed_development, maturation]).
crop_growth_stage(cotton, [germination, seedling, squaring, flowering, boll_development, boll_opening]).

% Facts about recommended fertilizers for crop growth stages
crop_fertilizer(wheat, [
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [nitrogen, sulfur],
    [nitrogen, potassium],
    [phosphorus, potassium],
    [calcium, magnesium],
    [potassium, sulfur],
    [potassium]
]).
crop_fertilizer(rice, [
    [nitrogen, phosphorus],
    [nitrogen],
    [nitrogen, potassium],
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [phosphorus, potassium],
    [nitrogen, potassium],
    [potassium],
    [potassium],
    [potassium]
]).
crop_fertilizer(corn, [
    [nitrogen, phosphorus],
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [nitrogen, phosphorus, potassium],
    [phosphorus, potassium],
    [potassium],
    [potassium],
    [potassium],
    [potassium],
    [potassium]
]).
crop_fertilizer(potato, [
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [phosphorus, potassium],
    [nitrogen, potassium],
    [potassium]
]).
crop_fertilizer(tomato, [
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [phosphorus, potassium],
    [calcium, magnesium],
    [potassium, calcium],
    [potassium]
]).
crop_fertilizer(soybean, [
    [phosphorus, potassium],
    [nitrogen, phosphorus],
    [phosphorus, potassium],
    [potassium, sulfur],
    [potassium, calcium],
    [potassium]
]).
crop_fertilizer(barley, [
    [nitrogen, phosphorus],
    [nitrogen],
    [nitrogen, potassium],
    [nitrogen, sulfur],
    [phosphorus, potassium],
    [potassium],
    [potassium],
    [potassium]
]).
crop_fertilizer(oats, [
    [nitrogen, phosphorus],
    [nitrogen],
    [nitrogen, potassium],
    [nitrogen, sulfur],
    [phosphorus, potassium],
    [potassium],
    [potassium],
    [potassium]
]).
crop_fertilizer(sunflower, [
    [nitrogen, phosphorus],
    [nitrogen, potassium],
    [phosphorus, boron],
    [potassium, sulfur],
    [potassium],
    [potassium]
]).
crop_fertilizer(cotton, [
    [nitrogen, phosphorus],
    [nitrogen],
    [nitrogen, potassium],
    [phosphorus, potassium],
    [potassium, boron],
    [potassium]
]).

% Facts about soil types suitable for each crop
crop_soil_type(wheat, [loam, clay_loam, silt_loam]).
crop_soil_type(rice, [clay, clay_loam, silt_clay]).
crop_soil_type(corn, [loam, silt_loam, sandy_loam]).
crop_soil_type(potato, [sandy_loam, loam, silt_loam]).
crop_soil_type(tomato, [loam, sandy_loam, clay_loam]).
crop_soil_type(soybean, [loam, clay_loam, silt_loam]).
crop_soil_type(barley, [loam, clay_loam, sandy_loam]).
crop_soil_type(oats, [loam, clay_loam, silt_loam]).
crop_soil_type(sunflower, [loam, clay_loam, sandy_loam]).
crop_soil_type(cotton, [loam, sandy_loam, alluvial]).