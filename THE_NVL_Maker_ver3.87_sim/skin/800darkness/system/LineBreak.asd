@loadcell
@loop
;
@macro name=copyone
@copy dx=0 dy=0 sx=%x sy=0 sw=25 sh=30
@wait time=70
@endmacro
;
*start
@copyone x=0
@copyone x=25
@copyone x=50
@copyone x=75
@copyone x=100
@copyone x=125
@copyone x=150
@copyone x=175
@copyone x=200
@copyone x=225
@copyone x=250
@copyone x=275
@copyone x=300
@copyone x=325
@copyone x=350
@copyone x=375
@copyone x=400
;
@copyone x=425
;
@copyone x=375
@copyone x=350
@copyone x=325
@copyone x=300
@copyone x=275
@copyone x=250
@copyone x=225
@copyone x=200
@copyone x=175
@copyone x=150
@copyone x=125
@copyone x=100
@copyone x=75
@copyone x=50
@copyone x=25
@jump target=*start