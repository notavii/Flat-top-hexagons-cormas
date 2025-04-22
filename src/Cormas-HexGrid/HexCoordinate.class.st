Class {
	#name : 'HexCoordinate',
	#superclass : 'Object',
	#instVars : [
		'x',
		'y',
		'z',
		'anotherObject',
		'hash'
	],
	#category : 'Cormas-HexGrid',
	#package : 'Cormas-HexGrid'
}

{ #category : 'instance creation' }
HexCoordinate class >> fromAxialQ: q r: r [
    "Create a HexCoordinate from axial coordinates q, r"
    ^ self new
        initializeWithX: q
        y: -1*(q + r)
        z: r;
        yourself.

]

{ #category : 'comparing' }
HexCoordinate >> = anotherObject [
    "Check if two coordinates are equal"
    self class = anotherObject class ifFalse: [ ^ false ].
    ^ x = anotherObject x and: [ y = anotherObject y and: [ z = anotherObject z ] ]
]

{ #category : 'comparing' }
HexCoordinate >> hash [
    ^ ((x hash bitXor: y hash) bitXor: z hash)
]

{ #category : 'initialization' }
HexCoordinate >> initializeWithX: xValue y: yValue z: zValue [
    x := xValue.
    y := yValue.
    z := zValue.

]

{ #category : 'navigation' }
HexCoordinate >> neighborCoordinates [
  
    ^ {
        self class fromAxialQ: x + 1 r: z - 1.  "East"
        self class fromAxialQ: x + 1 r: z.      "Northeast"
        self class fromAxialQ: x r: z + 1.      "Northwest"
        self class fromAxialQ: x - 1 r: z + 1.  "West"
        self class fromAxialQ: x - 1 r: z.      "Southwest"
        self class fromAxialQ: x r: z - 1.      "Southeast"
    }

]

{ #category : 'comparing' }
HexCoordinate >> x [
    ^ x
]

{ #category : 'comparing' }
HexCoordinate >> y [
    ^ y
]

{ #category : 'comparing' }
HexCoordinate >> z [
    ^ z
]
