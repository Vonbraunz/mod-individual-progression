/*
    Lets every class equip every weapon and armor type.

    Companion to bin/lua_scripts/all_classes_all_gear.lua, which grants the
    proficiency spells. This clears the server-side class mask.

    Why both: the core's Player::CanUseItem checks item_template.AllowableClass
    and rejects with EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM if your class bit is
    absent. The client separately greys out gear it thinks you lack proficiency
    for. The Lua script fixes the client, this fixes the server.

    Scope: class 2 (weapon) and class 4 (armor) only. Consumables, trade goods,
    quest items and so on are untouched.

    AllowableClass is a bitmask; -1 (0xFFFFFFFF) is every class bit, which the
    core accepts for any player. Rows already at -1 are skipped.

    Undo: restore from D:\Wow Server\backups\allgear\item_template.sql
*/

UPDATE `item_template` SET `AllowableClass` = -1 WHERE `class` IN (2, 4) AND `AllowableClass` <> -1;
