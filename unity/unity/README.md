# Ninja Game — Unity Coursework

A multi-level 2D action-platformer built in Unity, preserved in three closely related project copies: the working project, an Android-targeted version, and a Windows version.

## The game

The player controls an animated ninja through three scenes containing platforms, hazards, collectibles, and several enemy types. The character can run, jump and double-jump, attack with a sword, and throw shuriken. Enemy behaviours include snakes, witches, archers, moving attackers, and a boss with dedicated animations.

The game tracks score, coins, time, and three player lives. Losing a life pauses play and offers continue, level restart, or return to the main menu. Win/loss overlays, scene transitions, audio effects, options, and a menu system complete the game loop.

## Project variants

- `NinjaGame/` — the main Unity project snapshot.
- `NinjaGameAndroid/` — Android-focused copy and supporting notes.
- `NinjaGameWindowsVersion/` — the most clearly organised desktop version, with level scenes, menus, scripts, prefabs, animation controllers, sprites, textures, and audio.

## Implementation highlights

- C# `MonoBehaviour` scripts for player, projectile, enemy, camera, and game-state control.
- Unity 2D physics callbacks for collisions, triggers, damage, and pickups.
- Sprite animation controllers for idle, running, jumping, attacks, hits, enemies, and the boss.
- Runtime enemy/projectile instantiation and per-level scene management.
- Legacy immediate-mode GUI for health, score, and restart/win/loss screens.

## Running it today

This is an old Unity project using APIs such as `Application.LoadLevel` and the legacy GUI system. Open a copy in a historically compatible Unity editor or allow a modern editor to upgrade a duplicate checkout. Upgrade only one variant at a time because Unity rewrites scenes, project settings, and serialized assets.

## Historical note

The repository includes third-party visual and audio assets gathered for coursework. Their original licensing is not consistently recorded, so review asset rights before republishing or distributing a build.
