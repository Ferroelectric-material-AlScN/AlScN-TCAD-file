Electrode {
        { Name="Gate"   Voltage= 0 Schottky Workfunction= 4.33 }
        { Name="Source" Voltage= 0 EqOhmic }
        { Name="Drain"  Voltage= 0 EqOhmic }
	{ Name="Body"  Voltage= 0 EqOhmic }
}


File {
Grid= "@tdr@"
Parameter= "@parameter@"

Current= "@plot@"
Plot= "@tdrdat@"
Output= "@log@"

NewtonPlot= "n@node@np%d_%d_des.tdr"
}

Physics {
AreaFactor= 1000 * So that currents are given in A/mm
Mobility (
DopingDependence
Highfieldsaturation
)
EffectiveIntrinsicDensity (Nobandgapnarrowing)
Fermi
Recombination(
SRH
)
Piezoelectric_Polarization (strain(GateDependent))
Aniso(Poisson direction=(0, 0, 1))
Thermionic

DefaultParametersFromFile * Use parameter files within the MaterialDB
* directory to determine defaults.
}

Physics (MaterialInterface="Silicon/GaN"){
PiezoElectric_Polarization(activation=0)
}
Physics (MaterialInterface="AlOx/GaN") {
Traps(
(Donor Level Conc= 5e13 EnergyMid= 0.4 FromMidBandGap)
)

PiezoElectric_Polarization(activation=0)
}
Physics (MaterialInterface="AlGaN/AlN") {
Traps(
(Acceptor Level Conc= 1e10 EnergyMid= 0.4 FromMidBandGap)
)}

Physics( Region="region_AlGaN_Barrier" ){
   MoleFraction( xFraction= 0.26)
}

Physics( Material="AlScN" ){
   MoleFraction( xFraction= 0.43)
   Polarization(Memory=20)
}


Plot {
Electricfield/Vector
eCurrent/Vector hCurrent/Vector TotalCurrent/Vector

Polarization/Vector

SRH Avalanche
eMobility hMobility
eGradQuasiFermi hGradQuasiFermi
eEparallel hEparallel
ElectrostaticPotential
eVelocity hVelocity
DonorConcentration Acceptorconcentration
Doping SpaceCharge
ConductionBand ValenceBand  eQuasiFermiEnergy  hQuasiFermiEnergy 

QWeQuasiFermi
BandGap Affinity
xMoleFraction

PE_Polarization/Vector
PE_Charge
ConversePiezoelectricField/Tensor

# eBarrierTunneling
}

Math {
Extrapolate
ExtendedPrecision
Digits= 5
Iterations= 23

* Only required if anisotropic models are turned on
TensorGridAniso(Aniso)

* Refine solution until RHS increases or drops below 1e-3
* This improves robustness as initial guesses for computing new solution are more precise
* However, it leads to a larger number of Newton iterations and, therefore, slower simulations
CheckRhsAfterUpdate
RHSMin= 1e-4

Method= ILS(set= 11)
ILSrc="
set(11){
iterative(gmres(100), tolrel=1e-12, tolunprec=1e-6, tolabs=0, maxit=200);
preconditioning(ilut(5.0e-7,-1), right);
ordering(symmetric=nd, nonsymmetric=mpsilst);
options(compact=yes, linscale=0, refineresidual=10, verbose=0);
};
"
Number_of_Threads= 4
Wallclock

Transient= BE
# Traps(Damping= 0)
DirectCurrent

# Lowering relative error limit sometimes helps with convergence. No significant effect
# seen for simulations included in this project
ErrRef(electron)= 1e5
ErrRef(hole)= 1e5

# Set threshold densities for driving force damping large enough so that driving force is
# as free of noise as possible.
# Electrons will move parallel to interface while holes will primarily move vertically
RefDens_eGradQuasiFermi_EparallelToInterface= 1e8
RefDens_hGradQuasiFermi_ElectricField_HFS= 1e8

# ElementEdge averaging is believed to be a better option today than the default "Element"
eMobilityAveraging= ElementEdge
hMobilityAveraging= ElementEdge

SimStats
CNormPrint

ExitOnFailure

ComputeDopingConcentration * Forces S-Device to recompute DopingConcentration


    -CheckUndefinedModels

    # Increase number of discretized trap levels for smoother, though slower, simulated curves
    TrapDLN= 30

# Optional computation of simulation performance statistics
# Data saved in the plt file along with other data such as terminal voltages, currents
SimStats
}


Solve {
	# Solution at initial conditions
	# Tighten up Poisson-only solution to ensure better initial solution
	Coupled(RHSMin= 1e-8 Iterations= 1000 LineSearchDamping= 1e-4){ Poisson }
	Coupled(Iterations= 100) { Poisson Electron Hole }
	
	Plot(FilePrefix="n@node@_Zero")

	Transient (
		InitialTime= 0 FinalTime= 1
		InitialStep= 0.001 MinStep= 1e-5 Maxstep= 0.05
		Goal { Name= Drain Voltage= 1 }
	) {                  
		Coupled { Poisson Electron Hole } 
	}


	Transient (
		InitialTime= 1 FinalTime= 2
		InitialStep= 0.001 MinStep= 1e-5 Maxstep= 0.02
         	
		Goal { Name= Gate Voltage= -20 }
	) {                  
		Coupled { Poisson Electron Hole } 
			
		
	}
	NewCurrentFile="IdVg_"
	Transient (
		InitialTime= 2 FinalTime= 3
		InitialStep= 0.001 MinStep= 1e-5 Maxstep= 0.02
         	
		Goal { Name= Gate Voltage= 20 }
	) {Coupled { Poisson Electron Hole } 
		Plot(FilePrefix="n@node@_ss_N1" 
   		Time=(Range=(2 3) Intervals= 40) 
   		NoOverwrite
  		)}
	Transient (
		InitialTime= 3 FinalTime= 4
		InitialStep= 0.001 MinStep= 1e-5 Maxstep= 0.02
         	
		Goal { Name= Gate Voltage= -20 }
	) {                  
		Coupled { Poisson Electron Hole } 
			
		
	}
NewCurrentFile="IdVg_1"
	Transient (
		InitialTime= 4 FinalTime= 5
		InitialStep= 0.001 MinStep= 1e-5 Maxstep= 0.02
         	
		Goal { Name= Gate Voltage= 20 }
	) {Coupled { Poisson Electron Hole } 
		Plot(FilePrefix="n@node@_ss_N2" 
   		Time=(Range=(2 3) Intervals= 40) 
   		NoOverwrite
  		)}

}

