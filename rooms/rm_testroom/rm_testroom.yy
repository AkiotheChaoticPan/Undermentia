{
  "$GMRoom":"v1",
  "%Name":"rm_testroom",
  "creationCodeFile":"rooms/rm_testroom/RoomCreationCode.gml",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_E96D3BF_1","path":"rooms/rm_testroom/rm_testroom.yy",},
    {"name":"inst_693F7827_1","path":"rooms/rm_testroom/rm_testroom.yy",},
    {"name":"inst_3214FF26_2","path":"rooms/rm_testroom/rm_testroom.yy",},
    {"name":"inst_174E906E_2","path":"rooms/rm_testroom/rm_testroom.yy",},
    {"name":"inst_484FCF55_1","path":"rooms/rm_testroom/rm_testroom.yy",},
    {"name":"inst_227FFC66","path":"rooms/rm_testroom/rm_testroom.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Triggers","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_227FFC66","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_227FFC66","objectId":{"name":"obj_trigger_roomchange","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_trigger_roomchange","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"propertyId":{"name":"target_room","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"resource":{"name":"rm_testbed","path":"rooms/rm_testbed/rm_testbed.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"rm_testbed",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_trigger_roomchange","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"propertyId":{"name":"target_entrance_name","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"flowerbed_to_bed",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_trigger_roomchange","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"propertyId":{"name":"facing_dir_y","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"1",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"obj_trigger_roomchange","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"propertyId":{"name":"entrance_name","path":"objects/obj_trigger_roomchange/obj_trigger_roomchange.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"bed_to_flowerbed",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.6,"scaleY":1.0,"x":224.0,"y":309.0,},
      ],"layers":[],"name":"Triggers","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Entities","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_E96D3BF_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_E96D3BF_1","objectId":{"name":"obj_savelocation","path":"objects/obj_savelocation/obj_savelocation.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":320.0,"y":192.0,},
        {"$GMRInstance":"v1","%Name":"inst_693F7827_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_693F7827_1","objectId":{"name":"obj_player_spawn","path":"objects/obj_player_spawn/obj_player_spawn.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":288.0,"y":256.0,},
      ],"layers":[],"name":"Entities","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Core","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_3214FF26_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_3214FF26_2","objectId":{"name":"obj_camera","path":"objects/obj_camera/obj_camera.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"$GMRInstance":"v1","%Name":"inst_174E906E_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_174E906E_2","objectId":{"name":"obj_audiomanager","path":"objects/obj_audiomanager/obj_audiomanager.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":0.0,},
        {"$GMRInstance":"v1","%Name":"inst_484FCF55_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_484FCF55_1","objectId":{"name":"obj_graphicmanager","path":"objects/obj_graphicmanager/obj_graphicmanager.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
      ],"layers":[],"name":"Core","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Collision","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Collision","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":39,"SerialiseWidth":69,"TileCompressedData":[
          -425,-2147483648,-8,3,-60,-2147483648,-2,3,-6,-2147483648,1,3,-60,-2147483648,1,3,-7,-2147483648,1,3,
          -60,-2147483648,1,3,-7,-2147483648,1,3,-60,-2147483648,1,3,-7,-2147483648,1,3,-59,-2147483648,-2,3,-7,
          -2147483648,1,3,-59,-2147483648,1,3,-6,-2147483648,-3,3,-59,-2147483648,1,3,-6,-2147483648,1,3,-61,-2147483648,
          3,3,-2147483648,-2147483648,-5,3,-1708,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"ts_collision","path":"tilesets/ts_collision/ts_collision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRTileLayer":"","%Name":"Tileset","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Tileset","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":39,"SerialiseWidth":69,"TileCompressedData":[
          -214,-2147483648,12,0,1,2,3,4,5,6,7,8,9,10,11,-57,-2147483648,12,12,13,14,15,16,17,18,19,20,21,22,23,
          -57,-2147483648,12,24,25,26,27,28,29,30,31,32,33,34,35,-57,-2147483648,12,36,37,38,39,40,41,42,43,44,
          45,46,47,-57,-2147483648,12,48,49,50,51,52,53,54,55,56,57,58,59,-57,-2147483648,12,60,61,62,63,64,65,
          66,67,68,69,70,71,-57,-2147483648,12,72,73,74,75,76,77,78,79,80,81,82,83,-57,-2147483648,12,84,85,86,
          87,88,89,90,91,92,93,94,95,-57,-2147483648,12,96,97,98,99,100,101,102,103,104,105,106,107,-57,-2147483648,
          12,108,109,110,111,112,113,114,115,116,117,118,119,-57,-2147483648,12,120,121,122,123,124,125,126,127,
          128,129,130,131,-57,-2147483648,12,132,133,134,135,136,137,138,139,140,141,142,143,-1706,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"ts_test2","path":"tilesets/ts_test2/ts_test2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"rm_testroom",
  "parent":{
    "name":"Rooms",
    "path":"folders/Rooms.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":768,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":1366,
  },
  "sequenceId":null,
  "views":[
    {"hborder":16,"hport":1080,"hspeed":0,"hview":360,"inherit":false,"objectId":null,"vborder":16,"visible":true,"vspeed":0,"wport":1920,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}