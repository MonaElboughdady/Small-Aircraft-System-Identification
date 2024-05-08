varNames = {'Temps materiel  (mus)','Temps materiel (iso)'	,'Temps PCM (iso)'	,'Spatial time (iso)'	,'DM_deg'	,'DL_deg'	,'DN_deg'	,'DV1_unit'	,'dALF_cfg_deg'	,'DTM_unit'	,'DTN_unit'	,'EDM_daN'	,'EDN_daN'	,'ALF_G_deg'	,'BET_unit (*)'	,'ALF_D_deg'	,'MAPG_inhg'	,'MAPD_inhg'	,'FPG_psi'	,'FPD_psi'	,'OPG_psi'	,'OPD_psi'	,'OTG_degF'	,'OTD_degF'	,'FQG (raw)'	,'FQD (raw)'	,'VOI (raw)'	,'FU1_g'	,'FU2_g'	,'SN1_rev'	,'SN2_rev'	,'N1 (rpm)'	,'N2 (rpm)'	,'FF1_gph'	,'FF2_gph'	,'Sys Status'	,'Filter Status'	,'Unix time (s)'	,'Microseconds'	,'Lat (rad)'	,'Lon (rad)'	,'Height (m)'	,'Vnorth (m/s)'	,'Veast (m/s)'	,'Vdown (m/s)'	,'Acc_xb (m/s/s)'	,'Acc_yb (m/s/s)'	,'Acc_zb (m/s/s)'	,'Gforce (g)'	,'Roll_cor_deg (*)'	,'Pitch_cor_deg'	,'Heading_cor_deg (*)'	,'P_degps (*)'	,'Q_degps'	,'R_degps (*)'	,'Lat sdev (m)'	,'Lon sdev (m)'	,'Height sdev (m)'	,'DeltaP_Sim (Pa)'	,'Ps_Sim (Pa)'	,'CAS_Sim_kt'	,'TAS_Sim_kt'	,'Zp_Sim_ft'	,'Mach_Sim ()'	,'SAT_Sim (degC)'	,'TAT_Sim (degC)'	,'Vz_Sim_ftpmn'	,'Status_Sim (Hex)'	,'Acc_xb_raw (m/s/s)'	,'Acc_yb_raw (m/s/s)'	,'Acc_zb_raw (m/s/s)'	,'P_raw (rad/s)'	,'Q_raw (rad/s)'	,'R_raw (rad/s)'	,'Mag_xb_raw (mG)'	,'Mag_yb_raw (mG)'	,'Mag_zb_raw (mG)'	,'IMU_Temp (degC)'	,'Pressure (Pa)'	,'Pressure_Temp (degC)'	,'P29 seconds (s)'	,'P29 micro_s (mus)'	,'LatGPS (rad)'	,'LonGPS (rad)'	,'HeightGPS (m)'	,'VnorthGPS (m/s)'	,'VeastGPS (m/s)'	,'VdownGPS (m/s)'	,'LatGPS sdev (m)'	,'LonGPS sdev (m)'	,'HeightGPS sdev (m)'	,'TiltGPS (rad)'	,'HeadingGPS (rad)'	,'TiltGPS sdev (rad)'	,'HeadingGPS sdev (rad)'	,'StatusGPS (hex)'	,'ALF_G_prob_deg'	,'ALF_D_prob_deg'};
varTypes = {'double', 'datetime', 'datetime', 'datetime', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double'};
delimiter = '\t';
dataStartLine = 2;
opts = delimitedTextImportOptions('VariableNames', varNames,...
                                  'VariableTypes', varTypes,...
                                  'Delimiter', delimiter,...
                                  'DataLines', dataStartLine);
data = readtable("2024-2-26 12h7m7.csv", opts);

%%
% p_dot       = body axis roll acc                             | rad/s^2
% q_bar       = dynamic pressure                               | lbf/ft^2 | 
% S           = wing reference area                            | ft^2     | Constant
% b           = wing span                                      | ft^2     | Constant
% I_x         = moment of insertia                             | slug-ft^2|
% C_l_o       = nondimensional aerodynamic roll ref value      | 
% C_l_beta    = nondimensional aerodynamic roll sideslip angle |
% beta        = sideslip angle                                 | rad      |
% C_l_p       = nondimensional aerodynamic roll                |
% p           = body roll rate                                 | rad/s
% V           = true airspeed                                  | ft/s
% C_l_r       = nondimensional aerodynamic roll                |
% r           = body yaw rate                                  | ft/s
% C_l_delta_a = nondimensional aerodynamic roll                |
% delta_a     = aileron deflection                             | rad
% C_l_delta_r = nondimensional aerodynamic roll                |
% delta_r     = rudder deflection                              | rad
% c_1         = (I_y - I_z)/I_x                                |
% q           = body pitch rate                                | rad/s
% c_2         = I_xz/I_x                                       |
% r_dot       = body axis yaw acc                              | rad/s^2

