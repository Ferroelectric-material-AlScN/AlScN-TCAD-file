(sdegeo:create-rectangle (position 0 0 0)  (position 0.024 5 0) "AlGaN" "region_1_AlGaN")
(sde:set-default-material "GaN")
(sdegeo:create-rectangle (position 0.024 0 0)  (position 0.224 5 0) "GaN" "region_2_GaN")
(sde:set-default-material "Metal")
(sdegeo:set-default-boolean "ABA")

(sdegeo:create-rectangle (position 0 0 0)  (position 0.028 0.02 0) "Metal" "region_3_source")
(sdegeo:create-rectangle (position 0 4.98 0)  (position 0.026 5 0) "Metal" "region_4_drain")
(sdegeo:define-contact-set "body" 4  (color:rgb 1 0 0 ) "##")
(sdegeo:define-contact-set "drain" 4  (color:rgb 1 1 0 ) "##")
(sdegeo:define-contact-set "source" 4  (color:rgb 1 1 1 ) "##")
(sdegeo:set-current-contact-set "body")
(sdegeo:set-contact (list (car (find-edge-id (position 0.224 2.5 0)))) "body")
(sdegeo:set-current-contact-set "source")

(sdegeo:set-contact (list (car (find-edge-id (position 0.012 0.02 0)))) "source")




(sdegeo:set-contact (list (car (find-edge-id (position 0.026 0.02 0)))) "source")



(sdegeo:set-contact (list (car (find-edge-id (position 0.028 0.01 0)))) "source")



(sdegeo:set-current-contact-set "drain")

(sdegeo:set-contact (list (car (find-edge-id (position 0.012 4.98 0)))) "drain")




(sdegeo:set-contact (list (car (find-edge-id (position 0.025 4.98 0)))) "drain")




(sdegeo:set-contact (list (car (find-edge-id (position 0.026 4.99 0)))) "drain")




(sdedr:define-refeval-window "RefEvalWin_overall" "Rectangle"  (position 0 0 0) (position 0.224 5 0))

(sdedr:define-refinement-size "RefinementDefinition_overall" 50 50 25 25 )

(sdedr:define-refinement-placement "RefinementPlacement_overall" "RefinementDefinition_overall" (list "window" "RefEvalWin_overall" ) )

(sdedr:define-refeval-window "RefEvalWin_2_interface" "Rectangle"  (position 0.022 0 0.0)  (position 0.026 5 0.0) )

(sdedr:define-refinement-size "RefinementDefinition_interface" 0.005 0.005 0.003 0.003 )

(sdedr:define-refinement-placement "RefinementPlacement_interface" "RefinementDefinition_interface" (list "window" "RefEvalWin_2_interface" ) )

(sde:set-project-name "p1")

(sdesnmesh:iocontrols "outputFile" "n@node@")

(sde:set-meshing-command "snmesh")

(sde:set-project-name "p1")

(sdesnmesh:iocontrols "outputFile" "n@node@")

(sde:build-mesh "" "p1")

(system:command "svisual n@node@_msh.tdr &")






