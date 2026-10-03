/*
    Removes crafting cooldowns for Vanilla/TBC transmutes and cloth.
    Same spell list as mod-individual-progression's zz_optional_restore_crafting_cd_timers.sql,
    but overriding to zero instead of the long era timers.

    spell_cooldown_overrides REPLACES the spell's RecoveryTime/CategoryRecoveryTime,
    so 0/0 means "no cooldown". Takes effect on worldserver restart.
*/

DELETE FROM `spell_cooldown_overrides` WHERE `Id` IN (
    11479, 11480, 17187, 17559, 17560, 17561, 17562, 17563, 17564, 17565, 17566, 18560, 25146,  -- Vanilla
    26751, 28566, 28567, 28568, 28569, 29688, 32765, 32766, 31373, 36686                         -- TBC
);

INSERT INTO `spell_cooldown_overrides` (`Id`, `RecoveryTime`, `CategoryRecoveryTime`, `StartRecoveryTime`, `StartRecoveryCategory`, `Comment`) VALUES
-- Vanilla transmutes
(11479, 0, 0, 0, 0, "No cooldown: Transmute Iron to Gold"),
(11480, 0, 0, 0, 0, "No cooldown: Transmute Mithril to Truesilver"),
(17187, 0, 0, 0, 0, "No cooldown: Transmute Arcanite"),
(17559, 0, 0, 0, 0, "No cooldown: Transmute Air to Fire"),
(17560, 0, 0, 0, 0, "No cooldown: Transmute Fire to Earth"),
(17561, 0, 0, 0, 0, "No cooldown: Transmute Earth to Water"),
(17562, 0, 0, 0, 0, "No cooldown: Transmute Water to Air"),
(17563, 0, 0, 0, 0, "No cooldown: Transmute Undeath to Water"),
(17564, 0, 0, 0, 0, "No cooldown: Transmute Water to Undeath"),
(17565, 0, 0, 0, 0, "No cooldown: Transmute Life to Earth"),
(17566, 0, 0, 0, 0, "No cooldown: Transmute Earth to Life"),
(25146, 0, 0, 0, 0, "No cooldown: Transmute Elemental Fire"),
(18560, 0, 0, 0, 0, "No cooldown: Mooncloth"),
-- TBC
(28566, 0, 0, 0, 0, "No cooldown: Transmute Primal Air to Fire"),
(28567, 0, 0, 0, 0, "No cooldown: Transmute Primal Earth to Water"),
(28568, 0, 0, 0, 0, "No cooldown: Transmute Primal Fire to Earth"),
(28569, 0, 0, 0, 0, "No cooldown: Transmute Primal Water to Air"),
(29688, 0, 0, 0, 0, "No cooldown: Transmute Primal Might"),
(32765, 0, 0, 0, 0, "No cooldown: Transmute Earthstorm Diamond"),
(32766, 0, 0, 0, 0, "No cooldown: Transmute Skyfire Diamond"),
(26751, 0, 0, 0, 0, "No cooldown: Primal Mooncloth"),
(31373, 0, 0, 0, 0, "No cooldown: Spellcloth"),
(36686, 0, 0, 0, 0, "No cooldown: Shadowcloth");

/* Salt Shaker: make sure no item-level cooldown is set either */
UPDATE `item_template` SET `spellcooldown_1` = 0, `spellcategorycooldown_1` = 0 WHERE `entry` = 15846;
