Class {
	#name : 'HexCell',
	#superclass : 'Object',
	#instVars : [
		'coordinate',
		'neighbors',
		'agents'
	],
	#category : 'Cormas-HexGrid',
	#package : 'Cormas-HexGrid'
}

{ #category : 'initialization' }
HexCell >> agents [
    ^ agents
]

{ #category : 'initialization' }
HexCell >> coordinate [
    ^ coordinate

]

{ #category : 'initialization' }
HexCell >> coordinate: aHexCoordinate [
    coordinate := aHexCoordinate.
]

{ #category : 'as yet unclassified' }
HexCell >> findNeighborsIn: cellDictionary [
    neighbors := OrderedCollection new.
    coordinate neighborCoordinates do: [ :neighborCoord |
        | neighborCell |
        neighborCell := cellDictionary at: neighborCoord ifAbsent: [ nil ].
        neighborCell ifNotNil: [ neighbors add: neighborCell ].
    ].
]

{ #category : 'initialization' }
HexCell >> initialize [
    super initialize.
    neighbors := OrderedCollection new.
    agents := OrderedCollection new. "Add this line"
    coordinate := HexCoordinate fromAxialQ: 0 r: 0.

]

{ #category : 'as yet unclassified' }
HexCell >> neighbors [
    ^ neighbors
]
