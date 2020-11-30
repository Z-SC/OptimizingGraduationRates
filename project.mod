#34, 65

#Remember, there is relevant information not included in this model
#From the regression model we've determined coefficients (parameters)
#for the linear model we're optimizing.

#Parameters
#These coefficients are generated by the regression model 
param percentAdvancedClasses;
param demographicDispartiy;
param percentMaleTeachers;
param studentTeacherRatio;
param turnoverRate;
param specialEducationRatio;

#Variables  
#All these variables use the same language as their parameter counterparts
#A change in variable represents change to the value, not 
var pAC; #percentAdvancedClasses
var dD; #demographicDispartiy
var pMT; #percentMaleTeachers
var sTR; #studentTeacherRatio
var tR; #turnoverRate
var sER; #specialEducationRatio

#Constraints
#The reasoning behind these constraints is too verbose to variabilize
subject to c1: -.07334 <= pAC <= .1;
#The above references limits on percentAdvancedClasses
#Starting coefficient of .07334
#The minimum value of pAC is 0%
#The maximum value of pAC is 17%, determined by 'reasonable' maximum

subject to c2: dD - tR <= .2082; 
subject to c3: dD + tR >= -.2082; 
subject to c4: -.4266 <= dD <= .5734;
#The above references limits on demographicDisparity
#Starting coefficient of .4226
#The maximum total change of dD is limited by turnover rate
#The minimum value of dD is 0%

subject to c5: pMT - tR <= .2082;
subject to c6: pMT + tR >= -.2082;
subject to c7: -.2411 <= pMT <= .7589;
#The above references limits on percentMaleTeachers
#Starting coefficient of .2411
#The maximum total change of pMT is limited by turnover rate
#The minimum value of pMT is 0%

subject to c8: -6 <= sTR <= 4;
#The above references limits on studentTeacherRatio
#Starting ratio 1 teacher per 26 students
#The maximum ratio is 1 teacher per 30 students, determined by Colorado/federal law 
#The minimum ratio is 1 teacher per 20 students, determined by test schools' classroom count

subject to c9: -.2082 <= tR <= .3;
#The above references limits on turnoverRate
#Starting coefficient of .2082
#The maximum turnover rate is 50%, determined by a 'reasonable' maximum
#The minimum turnover rate is 0%

subject to c10: 0 <= sER <= .2;
#The above references limits on specialEducationRatio
#The starting ratio is assumed to be the minimum, .313 determined by Colorado/federal law

subject to c11: 1842000*pAC - 135753*sTR + 750000*tR + 162580*sER <= 0;
#The above references budgetary constraints
#Assumed an increase of $150k to budget, these are extraFunds
#Coefficients determined using a variety of sources on budgetary impacts

#Objective function
maximize graduationRates:
percentAdvancedClasses*pAC + demographicDispartiy*dD + percentMaleTeachers*pMT
+ studentTeacherRatio*sTR + turnoverRate*tR + specialEducationRatio*sER;
#Coefficients generated by regression file correspond to parameters