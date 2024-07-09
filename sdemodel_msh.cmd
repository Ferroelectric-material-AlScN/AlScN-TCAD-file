Title ""

Controls {
}

IOControls {
	outputFile = "n3"
	EnableSections
}

Definitions {
	Refinement "RefinementDefinition_Overall" {
		MaxElementSize = ( 100 100 )
		MinElementSize = ( 80 80 )
	}
	Refinement "RefinementDefinition_Gate_2" {
		MaxElementSize = ( 100 100 )
		MinElementSize = ( 80 80 )
	}
	Refinement "RefinementDefinition_Gate_1" {
		MaxElementSize = ( 100 100 )
		MinElementSize = ( 80 80 )
	}
	Refinement "RefinementDefinition_GaN_buff" {
		MaxElementSize = ( 0.8 0.8 )
		MinElementSize = ( 0.6 0.6 )
	}
	Refinement "RefinementDefinition_GaN_channel_buff" {
		MaxElementSize = ( 0.09 0.09 )
		MinElementSize = ( 0.07 0.07 )
	}
	Refinement "RefinementDefinition_channel_barr" {
		MaxElementSize = ( 0.003 0.04 )
		MinElementSize = ( 0.002 0.01 )
	}
	Refinement "RefinementDefinition_ferro_region" {
		MaxElementSize = ( 0.02 0.02 )
		MinElementSize = ( 0.01 0.01 )
	}
	Refinement "RefinementDefinition_RefEvalWin_Gate_Edge" {
		MaxElementSize = ( 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 )
	}
	Refinement "RefinementDefinition_RefEvalWin_Gate_Edge1" {
		MaxElementSize = ( 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 )
	}
}

Placements {
	Refinement "RefinementPlacement_Overall" {
		Reference = "RefinementDefinition_Overall"
		RefineWindow = Rectangle [(0 0) (2.253 6)]
	}
	Refinement "RefinementPlacement_Gate_2" {
		Reference = "RefinementDefinition_Gate_2"
		RefineWindow = region ["region_Gate"]
	}
	Refinement "RefinementPlacement_Gate_1" {
		Reference = "RefinementDefinition_Gate_1"
		RefineWindow = region ["region_Gate"]
	}
	Refinement "RefinementPlacement_GaN_buff" {
		Reference = "RefinementDefinition_GaN_buff"
		RefineWindow = region ["region_Gate"]
	}
	Refinement "RefinementPlacement_GaN_channel_buff" {
		Reference = "RefinementDefinition_GaN_channel_buff"
		RefineWindow = Rectangle [(0.253 0) (0.263 6)]
	}
	Refinement "RefinementPlacement_channel_barr" {
		Reference = "RefinementDefinition_channel_barr"
		RefineWindow = Rectangle [(0.074 0) (0.084 6)]
	}
	Refinement "RefinementPlacement_ferro_region" {
		Reference = "RefinementDefinition_ferro_region"
		RefineWindow = Rectangle [(0.013 2) (0.08 4)]
	}
}

