# Processing Sketches

Five visual programming projects created with Processing, ranging from small simulations to complete arcade-style games.

## Sketches

### BrickOutGame

A Breakout-inspired game built from custom circle, rectangle, paddle, car, and game-component classes. It handles paddle control, moving objects, brick/collision logic, scoring, win state, and restarting.

### FlappyBirds

A Flappy Bird-style side-scroller with a controllable bird, moving tower obstacles, reusable game-entity abstractions, collision detection, and scoring. A historical web export is included alongside the Processing source.

### GameofLife

An interactive Conway's Game of Life implementation with board rendering and generation updates. Keyboard controls randomise or clear the board, pause the simulation, and select predefined patterns including a blinker, block, glider, and Gosper glider gun; the mouse can draw cells while paused.

### Simulation_of_coin_falling

A simple physics sketch modelling a coin falling from a building. The `Coin` class and main sketch visualise vertical movement and acceleration under gravity.

### Stars

A configurable animation of rotating polygonal stars and a ship-like composition. The code separates reusable game components and lets the sketches vary position, corner count, and rotation speed.

## What I practised

- Processing's `setup()`/`draw()` lifecycle.
- Animation, frame-by-frame state, keyboard and mouse input.
- Geometry, simple physics, collision detection, and cellular automata.
- Building larger sketches from small reusable classes.

## Running the sketches

Open a sketch's main `.pde` file in the Processing IDE. These projects were written for an older Processing version, so the included web export and a few APIs may not work unchanged in current releases.
