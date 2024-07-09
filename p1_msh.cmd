Title ""

Controls {
}

IOControls {
	outputFile = "n1"
	EnableSections
}

Definitions {
	Refinement "RefinementDefinition_overall" {
		MaxElementSize = ( 50 50 )
		MinElementSize = ( 25 25 )
	}
	Refinement "RefinementDefinition_interface" {
		MaxElementSize = ( 0.005 0.005 )
		MinElementSize = ( 0.003 0.003 )
	}
}

Placements {
	Refinement "RefinementPlacement_overall" {
		Reference = "RefinementDefinition_overall"
		RefineWindow = Rectangle [(0 0) (0.224 5)]
	}
	Refinement "RefinementPlacement_interface" {
		Reference = "RefinementDefinition_interface"
		RefineWindow = Rectangle [(0.022 0) (0.026 5)]
	}
}

