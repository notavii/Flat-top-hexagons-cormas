Class {
	#name : 'HexAgent',
	#superclass : 'Object',
	#instVars : [
		'currentCell'
	],
	#category : 'Cormas-HexGrid',
	#package : 'Cormas-HexGrid'
}

{ #category : 'accessing' }
HexAgent >> currentCell [
    ^ currentCell
]

{ #category : 'accessing' }
HexAgent >> currentCell: aHexCell [
    currentCell := aHexCell
]

{ #category : 'as yet unclassified' }
HexAgent >> initialize [
    super initialize.
    currentCell := nil. 
]

{ #category : 'accessing' }
HexAgent >> moveToNeighbor [
    | neighbors |
    neighbors := currentCell neighbors.
    neighbors isEmpty ifFalse: [ 
        currentCell := neighbors atRandom.
        self updatePosition
    ]
]
