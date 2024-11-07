cls                                    // clear display in results window
clear                                  // clear previous work out of memory 
cd "/Users/professortu/Documents/Bachelor Thesis/malawi/2011/MWI_2010_IHS-III_v01_M_STATA8/Full_Sample/Household"
use HH_MOD_A_FILT , clear
merge		1:m case_id using HH_MOD_B, nogen
foreach 	file in HH_MOD_C HH_MOD_D HH_MOD_E {
merge 		1:1 case_id id_code using `file', nogen
}
/* Install asdoc
ssc install asdoc
* Install outreg2
ssc install outreg2
*/
*Children achievement: This research only focuses on the group of people who no longer go to school 
drop if hh_c11 == 1 | hh_c11 == . | hh_c11 ==7 // Eliminate those who are still in school

*Create variables for parents died before 11 years
gen dadlost1 = hh_b17 < 11
gen momlost1 = hh_b20 < 11
*Create variables for parents died before 16 years
gen dadlost2 = hh_b17 < 16
gen momlost2 = hh_b20 < 16
*Create variablesfor both parents died before 11 and 16 
gen dadmomlost1 = (hh_b17 < 11 & hh_b20 < 11)
gen dadmomlost2 = (hh_b17 < 16 & hh_b20 < 16)
*************************************************************************************************************************	
****************************************************Control variables****************************************************
*************************************************************************************************************************

*Create dummy variables for year born
gen year_born = hh_b06b
gen bornbefore1950 = hh_b06b < 1950
gen born1950_1960  = hh_b06b >= 1950 & hh_b06b < 1960 
gen born1960_1970  = hh_b06b >= 1960 & hh_b06b < 1970 
gen born1970_1980  = hh_b06b >= 1970 & hh_b06b < 1980 
gen born1980_1990  = hh_b06b >= 1980 & hh_b06b < 1990 
gen born1990_2000  = hh_b06b >= 1990 & hh_b06b < 2000 
gen born2000_2010  = hh_b06b >= 2000 & hh_b06b < 2010 
global bornlist bornbefore1950 born1950_1960 born1960_1970 born1970_1980 born1980_1990 born1990_2000 born2000_2010

* Create dummy variables for gender
gen female       = hh_b03 == 2

* Create dummy variables for religion
gen	religion 	 = hh_b23
gen none         = (hh_b23 == 1)
gen traditional  = (hh_b23 == 2)
gen christianity = (hh_b23 == 3)
gen islam        = (hh_b23 == 4)
global religionlist none traditional christianity islam
* Create dummy variables for location
gen location_urban = reside ==	1

* Create dummy variables for ethic
gen ethnic   = hh_b22
gen Chewa    = ethnic == 1
gen Nyanja   = ethnic == 2
gen Yao      = ethnic == 3
gen Tumbuka  = ethnic == 4
gen Lomwe    = ethnic == 5
gen Nkhonde  = ethnic == 6
gen Ngoni    = ethnic == 7
gen Sena     = ethnic == 8
gen Nyakyusa = ethnic == 9
gen Tonga    = ethnic == 10
gen Lambya   = ethnic == 11
gen Senga    = ethnic == 12
gen Sukwa    = ethnic == 13
gen English  = ethnic == 14
global ethniclist Chewa Nyakyusa Nyanja Yao Tumbuka Lomwe Nkhonde Ngoni Sena Tonga Lambya Senga Sukwa English 

*Number of members in household 
egen household_size = count(case_id), by(case_id)

************************************************************************************************************************
************************************************************************************************************************
***************************CASE 1: High education means one has achieved a University Diploma***************************
************************************************************************************************************************
************************************************************************************************************************

**Dependent variables
*Set childachieve1 to 1 for children with at least a university degree
gen childachieve1 = (hh_c09 == 6 | hh_c09 == 7) 

**Explanatoy variables
gen dadachieve1 		 = (hh_b18 == 6 | hh_b18 == 7) // Set dadachieve1 to 1 for dad with at least a university degree
gen momachieve1 		 = (hh_b21 == 6 | hh_b21 == 7) // Set momachieve1 to 1 for dad with at least a university degree
gen momdadachieve1       = ((hh_b18 == 6 | hh_b18 == 7) & (hh_b21 == 6 | hh_b21 == 7))

************************************************************************************************************************
************************************************************************************************************************
*************************CASE 2: High education means one has achieved a Non-University Diploma*************************
************************************************************************************************************************
************************************************************************************************************************


**Dependent variables
**Set childachieve2 to 1 for children with at least a Non-University degree
gen childachieve2 = (hh_c09 == 5 | hh_c09 == 6 | hh_c09 == 7) 

**Explanatoy variables
gen dadachieve2 	= (hh_b18 == 5| hh_b18 == 6 | hh_b18 == 7) // Set dadachieve1 to 1 for dad with at least a Non-university degree
gen momachieve2 	= (hh_b21 == 5| hh_b21 == 6 | hh_b21 == 7) // Set momachieve1 to 1 for dad with at least a Non-university degree
gen momdadachieve2       = ((hh_b18 == 5|hh_b18 == 6 | hh_b18 == 7) & (hh_b21 == 5|hh_b21 == 6 | hh_b21 == 7))
************************************************************************************************************************
************************************************************************************************************************
*************************CASE 3: High education means one has achieved a hihgschool degree*************************
************************************************************************************************************************
************************************************************************************************************************

**Dependent variables
**Set childachieve2 to 1 for children with at least a Non-University degree
gen childachieve3   = (hh_c09 == 4 | hh_c09 == 5 | hh_c09 == 6 | hh_c09 == 7) 
**Explanatoy variables
gen dadachieve3 	= (hh_b18 == 4 | hh_b18 == 5 | hh_b18 == 6 | hh_b18 == 7) // Set dadachieve1 to 1 for dad with at least a highschool degree 
gen momachieve3 	= (hh_b21 == 4 | hh_b21 == 5 | hh_b21 == 6 | hh_b21 == 7) // Set momachieve1 to 1 for dad with at least a highschool degree
gen momdadachieve3  = ((hh_b18 == 4 |hh_b18 == 5|hh_b18 == 6 | hh_b18 == 7) & (hh_b21 == 4 |hh_b21 == 5|hh_b21 == 6 | hh_b21 == 7))
global controlvar household_size female location_urban $bornlist $religionlist $ethniclist

************************************************************************************************************************
************************************************************************************************************************
****************************************************Probit regression***************************************************
************************************************************************************************************************
************************************************************************************************************************

*The regression is conditioned on momlost1==1, meaning it considers only cases where the mother lost her life before her child get to 11 
probit childachieve1 momachieve1 $controlvar if momlost1==1, nolog robust // 1.500496    .7171957     2.09   0.036 													  
margins, dydx(momachieve1) //  .0343768   .0186701     1.84   0.066 

probit childachieve2 momachieve1 $controlvar if momlost1==1, nolog robust //  .8537482   .6996851     1.22   0.222
margins, dydx(momachieve1) //  .0418324   .0340145     1.23   0.219
             			              																		  
probit childachieve3 momachieve1 $controlvar if momlost1==1, nolog robust // omitted
margins, dydx(momachieve1)  								              

probit childachieve1 momachieve2 $controlvar if momlost1==1, nolog robust // 1.500496   .7171957     2.09   0.036
margins, dydx(momachieve2) // .0343768   .0186701     1.84   0.066
																			
probit childachieve2 momachieve2 $controlvar if momlost1==1, nolog robust //  .8537482  .6996851     1.22   0.222
margins, dydx(momachieve2) // .0418324   .0340145     1.23   0.219

probit childachieve3 momachieve2 $controlvar if momlost1==1, nolog robust // omitted
margins, dydx(momachieve1)

probit childachieve3 momachieve3 $controlvar if momlost1==1, nolog robust // 1.676592   .4330251     3.87   0.000
margins, dydx(momachieve3) // .2138058   .0541073     3.95   0.000 

probit childachieve1 momachieve3 $controlvar if momlost1==1, nolog robust //  .4036272  .7263524     0.56   0.578  
margins, dydx(momachieve3) // .0096797   .0174955     0.55   0.580 

probit childachieve2 momachieve3 $controlvar if momlost1==1, nolog robust  // 1.506905   .5310977     2.84   0.005  
margins, dydx(momachieve3) // .0684582   .0243563     2.81   0.005

***After running these regression, we can observe that there the relationship when mom have a msce diploma and her child get a msce diplo and a non-university is positive but not a university degree. And if the mother have a non-university diploma or higher, her child would also tend to have a university diploma

probit childachieve1 momachieve1 $controlvar if momlost2==1, nolog robust // 2.34603    .695529     3.37   0.001 
margins, dydx(momachieve1) // .0462217   .0155271     2.98   0.003

probit childachieve2 momachieve1 $controlvar if momlost2==1, nolog robust // 1.811823   .6318278     2.87   0.004
margins, dydx(momachieve1) // .103017   .0365716     2.82   0.005

probit childachieve3 momachieve1 $controlvar if momlost2==1, nolog robust // omitted
margins, dydx(momachieve1)

probit childachieve1 momachieve2 $controlvar if momlost2==1, nolog robust // 1.459216   .5020205     2.91   0.004  
margins, dydx(momachieve2) // .0305593    .011588     2.64   0.008

probit childachieve2 momachieve2 $controlvar if momlost2==1, nolog robust // 1.451651   .4715869     3.08   0.002
margins, dydx(momachieve2) // .0820628   .0272289     3.01   0.003

probit childachieve3 momachieve2 $controlvar if momlost2==1, nolog robust // 1.851302   .6291961     2.94   0.003
margins, dydx(momachieve2) // .2273526   .0763246     2.98   0.003

probit childachieve1 momachieve3 $controlvar if momlost2==1, nolog robust // .8873334   .4364631     2.03   0.042  
margins, dydx(momachieve3) // .019544   .0103414     1.89   0.059

probit childachieve2 momachieve3 $controlvar if momlost2==1, nolog robust // 1.404918   .3222952     4.36   0.000  
margins, dydx(momachieve3) // .0765802   .0183268     4.18   0.000

probit childachieve3 momachieve3 $controlvar if momlost2==1, nolog robust // 1.365984   .2577649     5.30   0.000	
margins, dydx(momachieve3) // .1640946   .0303114     5.41   0.000

***But when the age of child when her mother died when he/she is less than 16, all of the coefficient show a relatively high number. I can said that mom role plays a very important role, it increase the probability that her child got high education a lot. Especially when she get a university degree

probit childachieve1 dadachieve1 $controlvar if dadlost1==1, nolog robust // 1.453151   .4482092     3.24   0.001
margins, dydx(dadachieve1) // .0311308   .0119688     2.60   0.009 

probit childachieve2 dadachieve1 $controlvar if dadlost1==1, nolog robust // 1.12816   .5101048     2.21   0.027
margins, dydx(dadachieve1) //.0439658   .0210088     2.09   0.036

probit childachieve3 dadachieve1 $controlvar if dadlost1==1, nolog robust // 1.156322   .3804625     3.04   0.002
margins, dydx(dadachieve1) //.1314461   .0429182     3.06   0.002 

probit childachieve1 dadachieve2 $controlvar if dadlost1==1, nolog robust // 1.261952   .4162763     3.03   0.002
margins, dydx(dadachieve2) //.0274795   .0110332     2.49   0.013

probit childachieve2 dadachieve2 $controlvar if dadlost1==1, nolog robust //  .8807102  .4808892     1.83   0.067 
margins, dydx(dadachieve2) //.034621    .0198127     1.75   0.081

probit childachieve3 dadachieve2 $controlvar if dadlost1==1, nolog robust //  .9412533  .3116275     3.02   0.003
margins, dydx(dadachieve2) //.1072403   .0353401     3.03   0.002

probit childachieve1 dadachieve3 $controlvar if dadlost1==1, nolog robust //  .8758377  .2917845     3.00   0.003
margins, dydx(dadachieve3) //.0188682   .0078318     2.41   0.016

probit childachieve2 dadachieve3 $controlvar if dadlost1==1, nolog robust //  .8417328  .2491584     3.38   0.001
margins, dydx(dadachieve3) //.0321106    .010461     3.07   0.002

probit childachieve3 dadachieve3 $controlvar if dadlost1==1, nolog robust //  .6567542  .148965      4.41   0.000 
margins, dydx(dadachieve3) //.0740497   .0167428     4.42   0.000

***The case seems to be different in dad case when almost every regessions are statiscally significant except when dad only have msce diploma

probit childachieve1 dadachieve1 $controlvar if dadlost2==1, nolog robust // 1.316753   .3227547     4.08   0.000
margins, dydx(dadachieve1) //.0286639   .0082811     3.46   0.001

probit childachieve2 dadachieve1 $controlvar if dadlost2==1, nolog robust // 1.206068   .3196036     3.77   0.000 
margins, dydx(dadachieve1) //.0512638   .0141695     3.62   0.000

probit childachieve3 dadachieve1 $controlvar if dadlost2==1, nolog robust // 1.389656   .2781968     5.00   0.000
margins, dydx(dadachieve1) //.1681508   .0333927     5.04   0.000

probit childachieve1 dadachieve2 $controlvar if dadlost2==1, nolog robust // 1.23501    .2716925     4.55   0.000 
margins, dydx(dadachieve2) //.0267218   .0072039     3.71   0.000

probit childachieve2 dadachieve2 $controlvar if dadlost2==1, nolog robust // 1.159112   .2514141     4.61   0.000 
margins, dydx(dadachieve2) //.0485968   .0112674     4.31   0.000

probit childachieve3 dadachieve2 $controlvar if dadlost2==1, nolog robust // 1.357052  .2084148     6.51   0.000
margins, dydx(dadachieve2) //.1618091   .0245668     6.59   0.000

probit childachieve1 dadachieve3 $controlvar if dadlost2==1, nolog robust // 1.142119   .2200666     5.19   0.000
margins, dydx(dadachieve3) //.0233132   .0056673     4.11   0.000

probit childachieve2 dadachieve3 $controlvar if dadlost2==1, nolog robust // 1.145592    .167712     6.83   0.000  
margins, dydx(dadachieve3) //.0449666   .0072916     6.17   0.000

probit childachieve3 dadachieve3 $controlvar if dadlost2==1, nolog robust // .9605578     .10098     9.51   0.000 
margins, dydx(dadachieve3) //.1115391   .0115997     9.62   0.000

***when dad died a bit later when child is less than 16 years old, the coefficient doesnt change a lot and there is still no relationship between dad having at least a msce diploma and weather his child have a msce or nonuniversity degree or not
probit childachieve1 momdadachieve1 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve1 momdadachieve2 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve1 momdadachieve3 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve2 momdadachieve1 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve2 momdadachieve2 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve2 momdadachieve3 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1) 
probit childachieve3 momdadachieve1 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve3 momdadachieve2 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve3 momdadachieve3 $controlvar if dadmomlost1==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve1 momdadachieve1 $controlvar if dadmomlost2==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve1 momdadachieve2 $controlvar if dadmomlost2==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve1 momdadachieve3 $controlvar if dadmomlost2==1, nolog  // 1.352321    .703393     1.92   0.055
margins, dydx(momdadachieve3) //.0431387    .028227     1.53   0.126																  
probit childachieve2 momdadachieve1 $controlvar if dadmomlost2==1, nolog robust // omitted											
margins, dydx(momachieve1)
probit childachieve2 momdadachieve2 $controlvar if dadmomlost2==1, nolog robust // omitted		
margins, dydx(momachieve1)
probit childachieve2 momdadachieve3 $controlvar if dadmomlost2==1, nolog robust // 1.943946   .5525552     3.52   0.000									
margins, dydx(momdadachieve3) //.1114113   .0345998     3.22   0.001										
probit childachieve3 momdadachieve1 $controlvar if dadmomlost2==1, nolog robust // 1.712284   .5651127    3.03   0.002 
margins, dydx(momachieve1)
probit childachieve3 momdadachieve2 $controlvar if dadmomlost2==1, nolog robust // omitted
margins, dydx(momachieve1)
probit childachieve3 momdadachieve3 $controlvar if dadmomlost2==1, nolog robust // 1.450339   .5033475     2.88   0.004
margins, dydx(momdadachieve3) //.1686065   .0570914     2.95   0.003	
													
***So I can conclude that parent achievement can only influence their children education when they live with them long enough =>>> Nurture impact is stronger 			
/*net describe collin, from(https://stats.idre.ucla.edu/stat/stata/ado/analysis)
net install collin*/




