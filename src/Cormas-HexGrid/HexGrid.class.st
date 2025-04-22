Class {
	#name : 'HexGrid',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'cellDictionary',
		'radius'
	],
	#category : 'Cormas-HexGrid',
	#package : 'Cormas-HexGrid'
}

{ #category : 'adding' }
HexGrid >> addAgent: anAgent toCell: aHexCell [
    aHexCell agents add: anAgent.
    anAgent currentCell: aHexCell
]

{ #category : 'accessing' }
HexGrid >> cellDictionary [
	^ cellDictionary 
]

{ #category : 'accessing' }
HexGrid >> cells [
	^ cells
]

{ #category : 'initialization' }
HexGrid >> initializeRadius: aRadius [

	radius := aRadius.
	cells := OrderedCollection new.
	cellDictionary := Dictionary new.

	-1 * radius to: radius do: [ :q | 
			-1 * radius to: radius do: [ :r |
					(q + r between: -1 * radius and: radius) ifTrue: [ 
							| coord cell |
							coord := HexCoordinate fromAxialQ: q r: r.
							cell := HexCell new
								        coordinate: coord;
								        yourself.
							cells add: cell.
							cellDictionary at: coord put: cell ] ] ].

	cells do: [ :cell | cell findNeighborsIn: cellDictionary ]
]

{ #category : 'accessing' }
HexGrid >> radius [
	^ radius 
]

{ #category : 'visualization' }
HexGrid >> visualize [

	| canvas hexSize |
	canvas := RSCanvas new.
	hexSize := 40.


	cells do: [ :cell |
			| shape x y points angle px py |
			points := OrderedCollection new.
			0 to: 5 do: [ :i |
					angle := (i * 60) degreesToRadians.
					px := (hexSize * angle cos) asFloat.
					py := (hexSize * angle sin) asFloat.
					points add: px @ py ].

			shape := RSPolygon new
				         points: points;
				         color: Color blue translucent ;
				         border: (RSBorder new
						          color: Color black;
						          width: 2);
				         model: cell.

			"Add mouse interactivity to HEXAGONS (not for agents)"
			shape when: RSMouseEnter do: [ 
				shape color: Color red.
				canvas signalUpdate 
				] for: self.
			shape
				when: RSMouseLeave
				do: [ shape color: Color blue translucent.
					canvas signalUpdate
					 ]
				for: self.

			"Positioning hexagon"
			x := cell coordinate x * 1.5 * hexSize.
			y := cell coordinate z + (cell coordinate x / 2)
			     * (hexSize * 3 sqrt).
			shape translateTo: x @ y.

			canvas add: shape ].

"agents"
	cells do: [ :cell |
			cell agents do: [ :agent |
					| agentShape x y |
					agentShape := RSEllipse new
						              size: 20;
						              color: Color red;
						              border: (RSBorder new
								               color: Color black;
								               width: 1).

					"Positioning agent relative to its cell"
					x := agent currentCell coordinate x * 1.5 * hexSize.
					y := agent currentCell coordinate z
					     + (agent currentCell coordinate x / 2) * (hexSize * 3 sqrt).
					agentShape translateTo: x @ y.

					canvas add: agentShape ] ].

	canvas @ RSCanvasController.
	canvas open
]
