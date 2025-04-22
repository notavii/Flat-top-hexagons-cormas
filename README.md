# Flat-Top Hexagons in Cormas Pharo 13
<p align="center"><img alt="CORMAS" src="https://github.com/user-attachments/assets/e9ac7a8c-f3c7-428e-af9a-6540f6e848a2" style="width: 50%; height: 50%"></p>


## Overview
Implementation and visualization of a flat-top hexagonal grid using **CORMAS** and **Roassal3** and **Pharo 13**.
Agents (red circles) can occupy any hexagonal cells, providing a foundation for spatial agent-based modeling.

## Features
* Hexagonal Grid Construction using cube/axial coordinates to generate a regular hexagonal tiles.
* Agents can be added to any cell on the grid
* The grid and agents are rendered with Roassal3. Hexagons highlight on mouse movement over them.

## How it works
* HexCoordinate : Implement cube/axial coordinates for grid
* HexCell : Represent each hex-cell, track neighbours and agents.
* HexAgent : Represent agents
* HexGrid : Manage the grid and visualization.

## Getting Started

* Load Roassal3 :
``` 
Metacello new
    baseline: 'Roassal';
    repository: 'github://pharo-graphics/Roassal';
    load: 'Full'.
```
* Load HexGrid Source Code
* Open Playground and Run
```
grid := HexGrid new initializeRadius: 2.

agent1 := HexAgent new.
grid addAgent: agent1 toCell: (grid cellDictionary at: (HexCoordinate fromAxialQ: 0 r: 0)).

agent2 := HexAgent new.
grid addAgent: agent2 toCell: (grid cellDictionary at: (HexCoordinate fromAxialQ: 1 r: -1)).

grid visualize.

```
## Output :


<p align="center"><video alt="CORMAS" src="https://github.com/user-attachments/assets/b9bd0769-3ef9-4d18-93dd-61fffb11a1e9" style="width: 50%; height: 50%"></p>



## Customization
* Change the grid radius in ```initializeRadius```
* Add more agents
* Implement custom agent interactions. 
