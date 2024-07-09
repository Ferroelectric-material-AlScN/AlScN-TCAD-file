Title ""

Controls {
}

IOControls {
	EnableSections
}

Definitions {
	Refinement "RefinementDefinition_overall" {
		MaxElementSize = ( 50 50 )
		MinElementSize = ( 10 10 )
	}
	Refinement "RefinementDefinition_interface" {
		MaxElementSize = ( 0.1 0.1 )
		MinElementSize = ( 0.01 0.01 )
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

