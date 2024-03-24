# Empire of Stars
A map for Dungeon Siege: Legends of Aranna.

FOSS, CC-BY-SA.

## About
\- ANCIENT ALIENS -\
Discover the Real Truth about the Empire of *STARS*!

On this map, you discover that the ancient Empire of Stars was actually an interstellar civilization, connecting distant star systems with powerful teleporters. Travel to other planets, meet lost parts of the Empire, find your missing aunt, and search for a way back home!

With help & content from:
- Eksevis, Sadowson, Tristanzz, Starfall & Orix from DS Discord,
- Kathy CF & Bare Elf from Siege The Day,
- Antonio R. (Hi-Res mod),
- Maps & resources from the original game and Project Britannia.

Detailed attribution see README_DISTRO.md

## Usage
Welcome to the repo. For editing, the repo checkout is supposed to be your "%USERPROFILE%\Documents\Dungeon Siege LoA\Bits" folder.

For building & running the map, you can use the /run.bat. It's supposed to be called from your DS installation folder, and TankCreator is supposed to be next to it. I hope it works for you; if not, regard it as "documentation as code".

## Region Overview
Here's an overview of the regions, with some basic info for quick reference.

Most regions were imported from the original maps KoE, UP & LoA. I had scripts making sure node IDs are unique and to convert DS1 regions to use the LoA node mesh index.

- Aranna
  - aranna-planet-island: Little Iliyara Island. Single-player start region, MP startpos, hermit loggerman, Alpha Centauri starstone. Based on: multiplayer_world/island
  - aranna-moon: The Moon. Magic moon dwarves & tavern. Based on: multiplayer_world/farmland_and_chapel (which FUN FACT is in turn derived from map_world/fh_r1, or the other way round, anyways they share node IDs)
  - aranna-redplanet: The Red Planet. Little green men. Red coloring done with special terrain lighting. Based on: map_world/dc_r1
- Interstellar Hub
  - interstellar-hub: The interstellar hub. Based on multiplayer_world/new_hub
- Alpha Centauri\
  The whole of Alpha Centauri planet is based on the beginning of the Kingdom of Ehb campaign.
  - alphacentauri-planet-town: Landing & Eddiloo incl. chapel, beginner shop, mule shop, hireable Laura, MP startpos. Based on: map_world/fh_r1
  - alphacentauri-planet-bearcave: Eddiloo cold storage. Secret crypt exit, Alpha Centauri starstone in MP. Based on: map_world/bc_r1
  - alphacentauri-planet-chapelbasement: Basement of Eddiloo chapel. Based on: map_world/hc_r1
  - alphacentauri-planet-forest: Eddiloo forest. Based on: map_world/path2crypts
  - alphacentauri-planet-hiddendungeon: Hidden dungeon in the forest. Armor of Stars. Based on: map_world/gd_b
  - alphacentauri-planet-crypt: Crypt of the Living Dead. Vega & Betelgeuse starstones. Based on: map_world/cr_r1
  - alphacentauri-moon: The moon of Alpha Centauri. Fear ring of Stars. Based on: multiplayer_world/crypts2sd
- Vega
  - vega-planet-southeast: Middle part of the jungle. Landing, MP startpos, Betelgeuse starstone, Vega starstone in MP. Based on: multiplayer_world/mega_forest_r3
  - vega-planet-southwest: Western part of the jungle. Poison ring of Stars, Alpha Centauri starstone in MP. Based on: multiplayer_world/mega_forest
  - vega-planet-northeast: Northern part of the jungle. Jungle Braak & giant Skrubb, lightning ring & stun ring of Stars, Altair & Rigel starstones. Based on: multiplayer_world/mega_forest_r2
  - vega-moon-landing: First half of Vega moon. Landing, helmet & boots of Stars, Aldebaran starstone. Based on: multiplayer_world/dark_forest
  - vega-moon-bridge: Other half of Vega moon. Based on: multiplayer_world/dark_forest_r2
- Betelgeuse
  - betelgeuse-planet-town: Palim Palim. Landing, MP startpos, general shop, tragg shop, hireable Aunt Luna (with robe of Stars & Betelgeuse starstone), hireable Dar's, Rigel starstone after quest, Betelgeuse starstone in MP. Based on: multiplayer_world/path2ice 
  - betelgeuse-planet-flowerforest1: Flower forest part 1. Based on: multiplayer_world/path2ice_r2
  - betelgeuse-planet-cave: Mucosa cave. Gloves of Stars. Based on: multiplayer_world/ice_cave
  - betelgeuse-planet-flowerforest2: Flower forest part 2. Spider boss, Vega starstone in MP. Based on: map_world/path2ac
  - betelgeuse-planet-lake: Wishy-Washy & Lake of the East. Rigel starstone by quest, general shop, tragg shop, hireable Blayze. Based on: multiplayer_world/ocean
  - betelgeuse-moon: The moon of Betelgeuse. Spellbook of Stars. Based on: multiplayer_world/hades
- Altair
  - altair-planet-town: Landing, MP startpos, Lagomsnö, mule shop, smith shop (best armor), magic shop, hireables Sig of Mugmort & Areianus. Based on: map_world/nt_r1
  - altair-planet-cellarcave: Cellar cave with lava. Altair starstone in MP. Based on: map_world/nt_r1a
  - altair-planet-woods: Winternight Woods & Aurora Shrine. Spark amulet of Stars, Vega starstone in MP. Based on: map_world/df_r0
  - altair-planet-elevator: Area around the Big Elevator. Based on: map_world/path2nt
  - altair-planet-caverns1: First half of Fireheart Caverns. Big Elevator landing, fire ring of Stars. Based on: multiplayer_world/sr2
  - altair-planet-caverns2: Second half of Fireheart Caverns. Small one-way elevator, Rigel starstone. Based on: multiplayer_world/sr_r5
  - altair-icemoon-mesa: First part of Ice Moon. Landing. Based on: map_expansion/a9_r1_mesa
  - altair-icemoon-canyon: Second part of Ice Moon. Based on: map_expansion/a1_r3_canyon
  - altair-icemoon-cave: Cave on Ice Moon. Ice ring of Stars, Aldebaran starstone. Based on: map_expansion/a1_r4_giantcave
- Rigel\
  The shrubs1-shrubs4 regions were auto-generated (dune terrain, plants & enemies) and then edited at their middles.
  - rigel-dryplanet-shrubs2-oasis: Oasis True Alpha. Landing, MP startpos, shields & general store (best shields), ranged store (best ranged weapons), melee store (best melee weapons). Auto-generated
  - rigel-dryplanet-shrubs3-lion: Golden Lion pointing to pyramid, Vega starstone in MP. Auto-generated
  - rigel-dryplanet-shrubs4-pyramid: Pyramid. Auto-generated
  - rigel-dryplanet-pyramid-entrance: Stairs down. Hand-made
  - rigel-dryplanet-pyramid-dungeon: Sword & ember amulet of Stars, Altair starstone. Based on: multiplayer_world/eg_seck_dungeon
  - rigel-dryplanet-exitcave: Cave after pyramid dungeon. Based on: multiplayer_world/oasis_cave
  - rigel-dryplanet-shrubs1-exit: Pyramid back exit. Auto-generated
  - rigel-wetplanet-town: Orionis. Landing, 2 tragg shops, magic shop (best spells), potion shop (best potions together with gobbot cantina barkeeper), jewellery shop (best jewellery), Rigel starstone in MP. Based on: map_expansion/a2_r6_wizardcity
  - rigel-wetplanet-wetlands-begin: Beginning of the wetlands. Lost Rune Master, bow of Stars. Based on: map_world/df_r1
  - rigel-wetplanet-wetlands-shrine: Middle of the wetlands. Azunite shrine with Fleshrender. Based on: map_world/ds_r1
  - rigel-wetplanet-wetlands-skull: End of the wetlands. Skull of the Fallen God with trapdoor, kraken boss. Based on: map_world/ds_r2
  - rigel-wetplanet-drystorage: Supposed dry storage of Orionis. Aldebaran starstone. Based on: map_world/ds_r2a
- Aldebaran
  - aldebaran-planet-town: Iliyuna. Magic shop, smith shop, 8 hireables. Based on: multiplayer_world/castle_town
  - aldebaran-planet-palace: Ruins of the Palace of Light. Shield of stars, Sirius starstone, lore library, Aldebaran starstone in MP. Based on: multiplayer_world/castle
  - aldebaran-ring-a: First half of planetary ring. Landing. Hand-made
  - aldebaran-ring-b: Other half of planetary ring. Acid ring of stars, Vega starstone in MP. Hand-made
- Sirius
  - sirius-asteroid: Teleport asteroid of Sirius. Landing, MP startpos, Sirius starstone in MP. Hand-made
  - sirius-banditmoon-bandits: Bandit Moon. Dark Generator, NPC, negative strength ring of Stars. Based on: map_world/df_bandits
  - sirius-banditmoon-loop: Tiny region to stitch Bandit Moon in a loop. Hand-made
  - sirius-deathmoon: Death Moon. Dark Generator, NPC ghost, negative dexterity ring of Stars. Based on: multiplayer_world/path2mines
  - sirius-machinemoon-cantina: First part of Machine Moon. Gobbot cantina, potion shop (best potions together with Orionis). Based on: map_world/gi_r4
  - sirius-machinemoon-darkgen: Second part of Machine Moon. Dark Generator, negative intelligence ring of Stars. Based on: map_world/gi_r5
  - sirius-planet-landing: Before Castle La Crimosa. Landing. Based on: map_world/ce_r1
  - sirius-planet-furycave: Fury cave. Based on: map_world/ce_r1a
  - sirius-planet-castle: Castle La Crimosa (entire castle - ground floor, upper floor, roof). All 8 starstones including Aranna, Seth King boss. Based on: map_world/ce_r2
  - sirius-planet-hell: Underground. Seth Queen Mother boss. Based on: map_world/gom2
  - sirius-planet-labyrinth: Putrid Garden. Based on: map_world/ce_r2a
