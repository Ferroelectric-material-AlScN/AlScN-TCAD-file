(bound? (quote region_Silicon_substrate))
(sdegeo:create-rectangle (position 1.253 0 0) (position 2.253 6 0) "Silicon" "region_Silicon_substrate")
(sde:set-default-material "GaN")
(bound? (quote region_GaN_Buffer))
(sdegeo:create-rectangle (position 0.253 0 0) (position 1.253 6 0) "GaN" "region_GaN_Buffer")
(bound? (quote region_GaN_channel))
(sdegeo:create-rectangle (position 0.073 0 0) (position 0.253 6 0) "GaN" "region_GaN_channel")
(sde:set-default-material "AlN")
(bound? (quote region_AlN))
(sdegeo:create-rectangle (position 0.072 0 0) (position 0.073 6 0) "AlN" "region_AlN")
(sde:set-default-material "AlGaN")
(bound? (quote region_AlGaN_Barrier))
(sdegeo:create-rectangle (position 0.047 0 0) (position 0.072 6 0) "AlGaN" "region_AlGaN_Barrier")
(sdegeo:set-default-boolean "ABA")
(sde:set-default-material "GaN")
(bound? (quote region_GaN_Cap_1))
(sdegeo:create-rectangle (position 0.044 0 0) (position 0.047 2.003 0) "GaN" "region_GaN_Cap_1")
(bound? (quote region_GaN_Cap_2))
(sdegeo:create-rectangle (position 0.047 2 0) (position 0.06 2.003 0) "GaN" "region_GaN_Cap_2")
(bound? (quote region_GaN_Cap_3))
(sdegeo:create-rectangle (position 0.057 2.003 0) (position 0.06 4 0) "GaN" "region_GaN_Cap_3")
(bound? (quote region_GaN_Cap_4))
(sdegeo:create-rectangle (position 0.044 3.997 0) (position 0.057 4 0) "GaN" "region_GaN_Cap_4")
(bound? (quote region_GaN_Cap_5))
(sdegeo:create-rectangle (position 0.044 4 0) (position 0.047 6 0) "GaN" "region_GaN_Cap_5")


(sdegeo:set-default-boolean "ABA")
(sde:set-default-material "AlOx")
(bound? (quote region_Al2O3_1))
(sdegeo:create-rectangle (position 0.04 0 0) (position 0.044 2.007 0) "AlOx" "region_Al2O3_1")
(bound? (quote region_Al2O3_2))
(sdegeo:create-rectangle (position 0.04 2.003 0) (position 0.057 2.007 0) "AlOx" "region_Al2O3_2")
(bound? (quote region_Al2O3_3))
(sdegeo:create-rectangle (position 0.053 2.007 0) (position 0.057 3.997 0) "AlOx" "region_Al2O3_3")
(bound? (quote region_Al2O3_4))
(sdegeo:create-rectangle (position 0.04 3.993 0) (position 0.053 3.997 0) "AlOx" "region_Al2O3_4")
(bound? (quote region_Al2O3_5))
(sdegeo:create-rectangle (position 0.04 3.997 0) (position 0.044 6 0) "AlOx" "region_Al2O3_5")

(sdegeo:set-default-boolean "ABA")
(bound? (quote region_AlScN))
(sdegeo:create-rectangle (position 0 0 0) (position 0.04 2.047 0) "AlScN" "region_AlScN_1")
(bound? (quote region_AlScN))
(sdegeo:create-rectangle (position 0.04 2.007 0) (position 0.053 2.047 0) "AlScN" "region_AlScN_2")
(bound? (quote region_AlScN))
(sdegeo:create-rectangle (position 0.013 2.047 0) (position 0.053 3.993 0) "AlScN" "region_AlScN_3")
(bound? (quote region_AlScN))
(sdegeo:create-rectangle (position 0 3.953 0) (position 0.013 3.993 0) "AlScN" "region_AlScN_4")
(bound? (quote region_AlScN))
(sdegeo:create-rectangle (position 0 3.993 0) (position 0.04 6 0) "AlScN" "region_AlScN_5")

(sdegeo:set-default-boolean "ABA")
(sde:set-default-material "Metal")
(define src.metal (sdegeo:create-rectangle
  (position 0 0 0) (position 0.083 0.05 0)
  "Metal" "tmp.source"
))

(define drn.metal (sdegeo:create-rectangle
  (position 0.0 5.95 0) (position 0.083 6 0)
  "Metal" "tmp.drain"
))

(define gt1.metal (sdegeo:create-rectangle
  (position -0.15 2 0) (position 0 4 0)
  "Metal" "tmp.gate"
))
(define gt2.metal (sdegeo:create-rectangle
  (position 0 2.047 0) (position 0.013 3.953 0)
  "Metal" "tmp.gate"
))

(sdegeo:define-contact-set "Gate" 4 (color:rgb 1 0 0) "##")
(sdegeo:define-contact-set "Source" 4 (color:rgb 1 0 1) "##")
(sdegeo:define-contact-set "Drain" 4 (color:rgb 1 1 0) "##")
(sdegeo:define-contact-set "Body" 4 (color:rgb 1 1 1) "##")

(sdegeo:set-current-contact-set "Gate")
(sdegeo:set-contact (list (car (find-edge-id (position -0.15 3 0))) (car (find-edge-id (position -0.075 2 0))) (car (find-edge-id (position -0.075 4 0))) (car (find-edge-id (position 0 3.0 0))) (car (find-edge-id (position 0.013 3.0 0))) (car (find-edge-id (position 0.0065 3.953 0))) (car (find-edge-id (position 0.0065 2.047 0))) (car (find-edge-id (position 0 2.0235 0))) (car (find-edge-id (position 0 3.973 0))) (car (find-edge-id (position 0 3.9965 0)))) "Gate")
(sdegeo:set-contact-boundary-edges gt1.metal)
(sdegeo:delete-region gt1.metal)
(sdegeo:set-contact-boundary-edges gt2.metal)
(sdegeo:delete-region gt2.metal)

(sdegeo:set-current-contact-set "Source")
(sdegeo:set-contact (list (car (find-edge-id (position 0 0.025 0))) (car (find-edge-id (position 0.0415 0 0))) (car (find-edge-id (position 0.02 0.05 0))) (car (find-edge-id (position 0.042 0.05 0))) (car (find-edge-id (position 0.0455 0.05 0))) (car (find-edge-id (position 0.0595 0.05 0))) (car (find-edge-id (position 0.0725 0.05 0))) (car (find-edge-id (position 0.078 0.05 0))) (car (find-edge-id (position 0.083 0.025 0)))) "Source")
(sdegeo:set-contact-boundary-edges src.metal)
(sdegeo:delete-region src.metal)

(sdegeo:set-current-contact-set "Drain")
(sdegeo:set-contact (list (car (find-edge-id (position 0 5.975 0))) (car (find-edge-id (position 0.02 5.95 0))) (car (find-edge-id (position 0.0415 6 0))) (car (find-edge-id (position 0.042 5.95 0))) (car (find-edge-id (position 0.0455 5.95 0))) (car (find-edge-id (position 0.0595 5.95 0))) (car (find-edge-id (position 0.0725 5.95 0))) (car (find-edge-id (position 0.078 5.95 0))) (car (find-edge-id (position 0.083 5.975 0)))) "Drain")
(sdegeo:set-contact-boundary-edges drn.metal)
(sdegeo:delete-region drn.metal)

(sdegeo:set-current-contact-set "Body")
(sdegeo:set-contact (list (car (find-edge-id (position 2.253 3 0)))) "Body")



(bound? (quote RefEvalWin_Overall))
(sdedr:define-refeval-window "RefEvalWin_Overall" "Rectangle" (position 0 0 0) (position 2.253 6 0))
(sdedr:define-refinement-size "RefinementDefinition_Overall" 100 100 80 80)
(sdedr:define-refinement-placement "RefinementPlacement_Overall" "RefinementDefinition_Overall" (list "window" "RefEvalWin_Overall"))

(sdedr:define-refinement-size "RefinementDefinition_Gate_2" 100 100 80 80)
(sdedr:define-refinement-placement "RefinementPlacement_Gate_2" "RefinementDefinition_Gate_2" (list "region" "region_Gate"))

(sdedr:define-refinement-size "RefinementDefinition_Gate_1" 100 100 80 80)
(sdedr:define-refinement-placement "RefinementPlacement_Gate_1" "RefinementDefinition_Gate_1" (list "region" "region_Gate"))

(sdedr:define-refeval-window "RefEvalWin_GaN_Buff" "Rectangle" (position 1.243 0 0.0) (position 1.263 6 0.0))
(sdedr:define-refinement-size "RefinementDefinition_GaN_buff" 0.8 0.8 0.6 0.6)
(sdedr:define-refinement-placement "RefinementPlacement_GaN_buff" "RefinementDefinition_GaN_buff" (list "region" "region_Gate"))

(sdedr:define-refeval-window "RefEvalWin_Gan_channel_buff" "Rectangle" (position 0.253 0 0.0) (position 0.263 6 0.0))
(sdedr:define-refinement-size "RefinementDefinition_GaN_channel_buff" 0.09 0.09 0.07 0.07)
(sdedr:define-refinement-placement "RefinementPlacement_GaN_channel_buff" "RefinementDefinition_GaN_channel_buff" (list "window" "RefEvalWin_Gan_channel_buff"))

(sdedr:define-refeval-window "RefEvalWin_channel_barrier" "Rectangle" (position 0.074 0 0.0) (position 0.084 6 0.0))
(sdedr:define-refinement-size "RefinementDefinition_channel_barr" 0.05 0.02 0.008 0.01)
(sdedr:define-refinement-placement "RefinementPlacement_channel_barr" "RefinementDefinition_channel_barr" (list "window" "RefEvalWin_channel_barrier"))

(sdedr:define-refeval-window "RefEvalWin_channel_barrier" "Rectangle" (position 0.072 0 0.0) (position 0.073 6 0.0))
(sdedr:define-refinement-size "RefinementDefinition_channel_barr" 0.003 0.04 0.002 0.01)
(sdedr:define-refinement-placement "RefinementPlacement_channel_barr" "RefinementDefinition_channel_barr" (list "window" "RefEvalWin_channel_barrier"))



(sdedr:define-refeval-window "RefEvalWin_Ferro_region" "Rectangle" (position 0.013 2 0.0) (position 0.08 4 0.0))
(sdedr:define-refinement-size "RefinementDefinition_ferro_region" 0.02 0.02 0.01 0.01)
(sdedr:define-refinement-placement "RefinementPlacement_ferro_region" "RefinementDefinition_ferro_region" (list "window" "RefEvalWin_Ferro_region"))

(sdedr:define-refeval-window "RefEvalWin_Ferro_region" "Rectangle" (position 0 2 0.0) (position 0.08 2.05 0.0))
(sdedr:define-refinement-size "RefinementDefinition_RefEvalWin_Gate_Edge" 0.002 0.002 0.001 0.001)
(sdedr:define-refinement-placement "RefinementPlacement_RefEvalWin_Gate_Edge" "RefinementDefinition_Gate_Edge" (list "window" "RefEvalWin_Gate_Edge"))

(sdedr:define-refeval-window "RefEvalWin_Ferro_region" "Rectangle" (position 0 3.95 0.0) (position 0.08 4.05 0.0))
(sdedr:define-refinement-size "RefinementDefinition_RefEvalWin_Gate_Edge1" 0.002 0.002 0.001 0.001)
(sdedr:define-refinement-placement "RefinementPlacement_RefEvalWin_Gate_Edge1" "RefinementDefinition_Gate_Edge1" (list "window" "RefEvalWin_Gate_Edge1"))

(sde:set-project-name "sdemodel")
(sdesnmesh:iocontrols "outputFile" "n3")
(sde:set-meshing-command "snmesh")
(sde:set-project-name "sdemodel")
(sdesnmesh:iocontrols "outputFile" "n3")
(sde:build-mesh "" "sdemodel")
(system:command "svisual n3_msh.tdr &")

