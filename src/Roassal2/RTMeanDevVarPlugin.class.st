Class {
	#name : #RTMeanDevVarPlugin,
	#superclass : #RTAbstractGrapherPlugin,
	#category : #'Roassal2-Builder-Grapher'
}

{ #category : #'as yet unclassified' }
RTMeanDevVarPlugin >> render [
	| values average from to l stdev b |
	values := self datasetValues.
	average := values average.
	
	"The variation"
	stdev := values stdev.
	from := builder getPixelPositionOf: builder minX @ (average - stdev).
	to := builder getPixelPositionOf: builder maxX @ (average + stdev).
	b := self boxFrom: from to: to.
	b @ (RTPopup text: 'stdev = ', stdev asString).
	
	"The mean"
	from := builder getPixelPositionOf: builder minX @ average.
	to := builder getPixelPositionOf: builder maxX @ average.
	l := self lineFrom: from to: to.
	l @ (RTPopup text: 'average = ', average asString).
	

]