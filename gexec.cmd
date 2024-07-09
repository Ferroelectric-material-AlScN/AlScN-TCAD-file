# project name
name trpas_changed_both_donor_and_acceptor_AlScN
# execution graph
job 4 -d "3"  -post { extract_vars "$nodedir" n4_des.out 4 }  -o n4_des "sdevice pp4_des.cmd"
job 3   -post { extract_vars "$nodedir" n3_dvs.out 3 }  -o n3_dvs "sde -e -l n3_dvs.cmd"
check sde1_dvs.cmd 1720430241
check sdevice_des.cmd 1720438731
check sdevice.par 1719824272
check global_tooldb 1643313649
check gtree.dat 1718859787
check ./AlN.par 1640151510
check ./AlGaN.par 1640151510
check ./GaN.par 1640151510
check ./Silicon.par 1640151510
check AlN.par 1640151510
check AlGaN.par 1640151510
check GaN.par 1640151510
check Silicon.par 1640151510
check AlN.par 1640151510
check AlGaN.par 1640151510
check GaN.par 1640151510
check Silicon.par 1640151510
check AlN.par 1640151510
check AlGaN.par 1640151510
check GaN.par 1640151510
check Silicon.par 1640151510
check AlN.par 1640151510
check AlGaN.par 1640151510
check GaN.par 1640151510
check Silicon.par 1640151510
# included files
file sdevice.par included ./AlGaN.par
file sdevice.par included ./GaN.par
file sdevice.par included ./Silicon.par
file sdevice.par included ./AlN.par
