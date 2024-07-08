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

% Rules

% Rule to get the list of recommended fertilizers for a crop at a specific growth stage
fertilizer_list_for_crop_growth_stage(Crop, GrowthStage, FertilizerList) :-
    crop_fertilizer(Crop, AllFertilizers),
    crop_growth_stage(Crop, AllGrowthStages),
    nth0(Index, AllGrowthStages, GrowthStage),
    nth0(Index, AllFertilizers, FertilizerList).

% Rule to get the list of recommended fertilizers for a crop type, soil type, and growth stage
fertilizer_list_for_crop_soil_growth_stage(Crop, Soil, GrowthStage, FertilizerList) :-
    crop_soil_type(Crop, SuitableSoils),
    (   member(Soil, SuitableSoils) ->
        fertilizer_list_for_crop_growth_stage(Crop, GrowthStage, FertilizerList)
    ;   write('This crop cannot grow in this soil type.'), nl, fail
    ).

% Rule to get the list of crops that can grow in a specific soil type
crops_for_soil_type(Soil, Crops) :-
    findall(Crop, (crop_soil_type(Crop, SuitableSoils), member(Soil, SuitableSoils)), Crops).

% Rule to get the list of fertilizers a crop needs
fertilizer_list_for_crop(Crop, FertilizerList) :-
    crop_fertilizer(Crop, FertilizerList).

% predicates

% Interactive predicate to get fertilizer list for crop and growth stage
get_fertilizer_list_for_crop_growth_stage :-
    write('Enter the crop: '), read(Crop),
    write('Enter the growth stage: '), read(GrowthStage),
    (   fertilizer_list_for_crop_growth_stage(Crop, GrowthStage, FertilizerList) ->
        format('Recommended fertilizers for ~w at ~w stage: ~w~n', [Crop, GrowthStage, FertilizerList])
    ;   write('Invalid input or no data available.'), nl
    ).

% Interactive predicate to get fertilizer list for crop, soil, and growth stage
get_fertilizer_list_for_crop_soil_growth_stage :-
    write('Enter the crop: '), read(Crop),
    write('Enter the soil type: '), read(Soil),
    write('Enter the growth stage: '), read(GrowthStage),
    (   fertilizer_list_for_crop_soil_growth_stage(Crop, Soil, GrowthStage, FertilizerList) ->
        format('Recommended fertilizers for ~w in ~w soil at ~w stage: ~w~n', [Crop, Soil, GrowthStage, FertilizerList])
    ;   write('Invalid input or no data available.'), nl
    ).

% Interactive predicate to get crops for soil type
get_crops_for_soil_type :-
    write('Enter the soil type: '), read(Soil),
    (   crops_for_soil_type(Soil, Crops) ->
format('Crops that can grow in ~w soil: ~w~n', [Soil, Crops])
;   write('Invalid input or no data available.'), nl
).

% Interactive predicate to get the fertilizer list for a crop across all growth stages
get_fertilizer_list_for_crop :-
write('Enter the crop: '), read(Crop),
(   fertilizer_list_for_crop(Crop, FertilizerList) ->
    format('Recommended fertilizers for ~w across all growth stages: ~w~n', [Crop, FertilizerList])
;   write('Invalid input or no data available.'), nl
).

% Helper predicate to display available crop types
display_crop_types :-
write('Available crop types: '), findall(Crop, crop_type(Crop), Crops), writeln(Crops).

% Helper predicate to display available soil types
display_soil_types :-
write('Available soil types: '), findall(Soil, soil_type(Soil), Soils), writeln(Soils).

% Helper predicate to display available fertilizers
display_fertilizers :-
write('Available fertilizers: '), findall(Fertilizer, fertilizer(Fertilizer), Fertilizers), writeln(Fertilizers).

% Helper predicate to display growth stages for a specific crop
display_growth_stages(Crop) :-
(   crop_growth_stage(Crop, GrowthStages) ->
    format('Growth stages for ~w: ~w~n', [Crop, GrowthStages])
;   write('Invalid crop or no data available.'), nl
).

% Main interactive menu
main_menu :-
write('Select an option:'), nl,
write('1. Display available crop types'), nl,
write('2. Display available soil types'), nl,
write('3. Display available fertilizers'), nl,
write('4. Display growth stages for a crop'), nl,
write('5. Get recommended fertilizers for a crop and growth stage'), nl,
write('6. Get recommended fertilizers for a crop, soil type, and growth stage'), nl,
write('7. Get crops that can grow in a specific soil type'), nl,
write('8. Get recommended fertilizers for a crop across all growth stages'), nl,
write('9. Exit'), nl,
read(Choice),
(   Choice = 1 -> display_crop_types, main_menu
;   Choice = 2 -> display_soil_types, main_menu
;   Choice = 3 -> display_fertilizers, main_menu
;   Choice = 4 -> write('Enter the crop: '), read(Crop), display_growth_stages(Crop), main_menu
;   Choice = 5 -> get_fertilizer_list_for_crop_growth_stage, main_menu
;   Choice = 6 -> get_fertilizer_list_for_crop_soil_growth_stage, main_menu
;   Choice = 7 -> get_crops_for_soil_type, main_menu
;   Choice = 8 -> get_fertilizer_list_for_crop, main_menu
;   Choice = 9 -> write('Exiting...'), nl
;   write('Invalid choice, please try again.'), nl, main_menu
).

% Start the interactive menu
start :-
write('Welcome to the Crop Management System'), nl,
main_menu.
