local HBD = LibStub("HereBeDragons-2.0")
--local Pins = LibStub("HereBeDragons-Pins-2.0")

--To add new items, go to the location of interest and then run "/way local"
--Note the map reference and coordinates give in the output and then add an
--entry similar to what is below. After saving your modified file you can test
--it by doing a "/way reset all" (THIS WILL NUKE ALL WAYPOINTS IN TOMTOM) followed by "/reload ui"
--Steps tested September 15, 2019 in WoW Classic.
local flight_masters_alliance = {
    { npc = 1573, name = "Flight:Gryth Thurden", coords = { 55.6, 48.2 }, map = 1455 },
    { npc = 1572, name = "Flight:Thorgrum Borrelson", coords = { 33.8, 50.8 }, map = 1432 },
    { npc = 352, name = "Flight:Dungar Longdrink", coords = { 66, 62.6 }, map = 1453 },
    { npc = 3838, name = "Flight:Vesprystus", coords = { 58.4, 94 }, map = 1438 },
    { npc = 523, name = "Flight:Thor", coords = { 56.4, 52.6 }, map = 1436 },
    { npc = 16227, name = "Flight:Bragok", coords = { 63, 37 }, map = 1413 },
    { npc = 3841, name = "Flight:Caylais Moonfeather", coords = { 36.4, 45.4 }, map = 1439 },
    { npc = 1571, name = "Flight:Shellei Brondir", coords = { 9.4, 59.6 }, map = 1437 },
    { npc = 931, name = "Flight:Ariena Stormfeather", coords = { 30.6, 59.2 }, map = 1433 },
    { npc = 2859, name = "Flight:Gyll", coords = { 27.4, 77.6 }, map = 1434 },
    { npc = 4321, name = "Flight:Baldruc", coords = { 67.4, 51.2 }, map = 1445 },
    { npc = 2432, name = "Flight:Darla Harris", coords = { 49.4, 52.4 }, map = 1424 },
    { npc = 7823, name = "Flight:Bera Stonehammer", coords = { 51, 29.2 }, map = 1446 },
    { npc = 2941, name = "Flight:Lanie Reed", coords = { 37.8, 30.6 }, map = 1427 },
    { npc = 4407, name = "Flight:Teloren", coords = { 36.4, 7.2 }, map = 1442 },
    { npc = 2835, name = "Flight:Cedrik Prose", coords = { 45.8, 46.2 }, map = 1417 },
    { npc = 6706, name = "Flight:Baritanas Skyriver", coords = { 64.6, 10.4 }, map = 1443 },
    { npc = 4319, name = "Flight:Thyssiana", coords = { 89.4, 45.8 }, map = 1444 },
    { npc = 4319, name = "Flight:Daelyshia", coords = { 34.41, 48.0 }, map = 1440 },
    { npc = 2409, name = "Flight:Felicia Maline", coords = { 77.45, 44.22 }, map = 1431 },
}

local flight_masters_horde = {
    { npc = 3310, name = "Flight:Doras", coords = { 45.2, 63.8 }, map = 1454 },
    { npc = 3615, name = "Flight:Devrak", coords = { 51.4, 30.2 }, map = 1413 },
    { npc = 4551, name = "Flight:Michael Garrett", coords = { 62.8, 47.2 }, map = 1458 },
    { npc = 2226, name = "Flight:Karos Razok", coords = { 45.6, 42.4 }, map = 1421 },
    { npc = 2995, name = "Flight:Tal", coords = { 46.8, 50 }, map = 1456 },
    { npc = 16227, name = "Flight:Bragok", coords = { 63, 37 }, map = 1413 },
    { npc = 4312, name = "Flight:Tharm", coords = { 45.2, 59.8 }, map = 1442 },
    { npc = 10378, name = "Flight:Omusa Thunderhorn", coords = { 44.4, 59 }, map = 1413 },
    { npc = 11901, name = "Flight:Andruk", coords = { 12.2, 33.8 }, map = 1440 },
    { npc = 2858, name = "Flight:Gringer", coords = { 26.8, 77 }, map = 1434 },
    { npc = 12616, name = "Flight:Vhulgra", coords = { 73.2, 61.4 }, map = 1440 },
    { npc = 10583, name = "Flight:Gryfe", coords = { 45.2, 5.8 }, map = 1449 },
    { npc = 2389, name = "Flight:Zarise", coords = { 60.2, 18.6 }, map = 1424 },
    { npc = 1387, name = "Flight:Thysta", coords = { 32.4, 29.2 }, map = 1434 },
    { npc = 4317, name = "Flight:Nyse", coords = { 45, 49.2 }, map = 1441 },
    { npc = 7824, name = "Flight:Bulkrek Ragefist", coords = { 51.6, 25.4 }, map = 1446 },
    { npc = 11899, name = "Flight:Shardi", coords = { 35.6, 31.8 }, map = 1445 },
    { npc = 2851, name = "Flight:Urda", coords = { 73, 32.6 }, map = 1417 }
}


local flight_masters
local faction, _ = UnitFactionGroup("player")
if (faction == 'Alliance') then
    flight_masters = flight_masters_alliance
elseif (faction == 'Horde') then
    flight_masters = flight_masters_horde
end

for _, npc in ipairs(flight_masters) do
    -- Pins:AddWorldMapIconMap('flight', 'GatherMate2WorldMapPinTemplate', 1455, 55.6, 48.2)
    TomTom:AddWaypoint(npc.map, npc.coords[1]/100, npc.coords[2]/100, {
        title = string.format("%s (%s)", npc.name, HBD:GetLocalizedMap(npc.map)),
        minimap = true,
        crazy = false,
    })
end