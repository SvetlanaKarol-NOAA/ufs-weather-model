
Dirin='/scratch1/NCEPDEV/stmp4/Svetlana.Karol/WAM_NUDG_20150301/'
file='input_parameters_old.nc'
fileout='vyinput_parameters.nc'
;minutes since 2020-01-01 00:00:00'

ncid = NCDF_OPEN( file, /nowrite)
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'time'), time
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'f107'), f107
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'kp'), kp
NCDF_VARGET, ncid, NCDF_VARID(ncid,'f107d'), f107d
NCDF_VARGET, ncid, NCDF_VARID(ncid,'kpa'), kpa

 NCDF_VARGET, ncid, NCDF_VARID(ncid,'nhp'), nhp
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'nhpi'),nhpi
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'shp'), shp
 
NCDF_VARGET, ncid, NCDF_VARID(ncid,'shpi'), shpi
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'swbt'), swbt
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'swang'), swang

NCDF_VARGET, ncid, NCDF_VARID(ncid,'swvel'), swvel
NCDF_VARGET, ncid, NCDF_VARID(ncid,'swbz'), swbz
NCDF_VARGET, ncid, NCDF_VARID(ncid,'swden'), swden
NCDF_VARGET, ncid, NCDF_VARID(ncid,'ap'), ap
 NCDF_VARGET, ncid, NCDF_VARID(ncid,'apa'), apa 




Id =  NCDF_CREATE(fileout, /CLOBBER)

time_dim         =  NCDF_DIMDEF(Id, 'time',  /UNLIMITED)
time_cal         =  NCDF_DIMDEF(Id, 'calformat', [5])
;minutes since 2020-01-01 00:00:00'


time_id  = NCDF_VARDEF(Id, 'time', [time_dim],/LONG)
ydhms_id = NCDF_VARDEF(Id, 'y4d3h2m2s2',[time_cal],/FLOAT)

f107_id  =NCDF_VARDEF(Id, 'f107',[time_dim],/FLOAT)
kp_id  =NCDF_VARDEF(Id, 'kp',[time_dim],/FLOAT)
f107d_id  =NCDF_VARDEF(Id, 'f107d',[time_dim],/FLOAT)
kpa_id  =NCDF_VARDEF(Id, 'kpa',[time_dim],/FLOAT)
nhp_id  =NCDF_VARDEF(Id, 'nhp',[time_dim],/FLOAT)
nhpi_id  =NCDF_VARDEF(Id, 'nhpi',[time_dim],/SHORT)
shp_id  =NCDF_VARDEF(Id, 'shp',[time_dim],/FLOAT)
shpi_id  =NCDF_VARDEF(Id, 'shpi',[time_dim],/SHORT)
swbt_id  =NCDF_VARDEF(Id, 'swbt',[time_dim],/FLOAT)
swang_id  =NCDF_VARDEF(Id, 'swang',[time_dim],/FLOAT)
swvel_id  =NCDF_VARDEF(Id, 'swvel',[time_dim],/FLOAT)
swbz_id  =NCDF_VARDEF(Id, 'swbz',[time_dim],/FLOAT)
swden_id  =NCDF_VARDEF(Id, 'swden',[time_dim],/FLOAT)
ap_id  =NCDF_VARDEF(Id, 'ap',[time_dim],/FLOAT)
apa_id  =NCDF_VARDEF(Id, 'apa',[time_dim],/FLOAT)

ncdf_attput, id, /GLOBAL, 'skip', "2160"
ncdf_attput, id, /GLOBAL, 'ifp_interval',"60"
; ifp_interval = 60" 
;;;ncdf_attput, id, /GLOBAL,  ':',"ifp_interval = 60"



ncdf_attput, id, ydhms_id, 'units', ' time-format:y4d3hhmmsc '
ncdf_attput, id,time_id, 'units', 'minutes since 2020-01-01 00:00:00'
ncdf_attput, id,f107_id, 'units', 'sfu'
ncdf_attput, id,f107d_id, 'units', 'sfu'
ncdf_attput, id,nhp_id, 'units', 'GW'
ncdf_attput, id,shp_id, 'units', 'GW'
ncdf_attput, id,swbt_id, 'units', 'nT'
ncdf_attput, id,swang_id, 'units', 'degrees'
ncdf_attput, id,swvel_id, 'units', 'm/s'
ncdf_attput, id,swbz_id, 'units', 'nT'
ncdf_attput, id,swden_id, 'units', 'cm^-3'

NCDF_CONTROL, id, /ENDEF
nt=3601
time1=findgen(3601)
Aydms = fltarr(5)
Aydms(0) = 2020.0
Aydms(1) = 001.0
Aydms(2) = 0.0
Aydms(3) = 0.0
Aydms(4) = 0.0

ncdf_varput, id, time_id, time1
ncdf_varput, id, f107_id, f107
ncdf_varput, id, kp_id, kp
ncdf_varput, id, f107d_id, f107d
ncdf_varput, id, kpa_id, kpa
ncdf_varput, id, nhp_id, nhp

ncdf_varput, id, nhpi_id, nhpi
ncdf_varput, id, shp_id, shp
ncdf_varput, id, shpi_id, shpi

ncdf_varput, id, swbt_id, swbt
ncdf_varput, id, swang_id, swang
ncdf_varput, id, swvel_id, swvel
ncdf_varput, id, swbz_id, swbz
ncdf_varput, id, swden_id, swden
ncdf_varput, id, ap_id, ap
ncdf_varput, id, apa_id, apa

ncdf_varput, id, ydhms_id, Aydms

ncdf_close,id



print, fileout








end


