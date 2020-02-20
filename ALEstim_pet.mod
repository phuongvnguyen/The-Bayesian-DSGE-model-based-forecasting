///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// modifying model by excluding goverment sector

var 
pid_hat,
pimc_hat,
pimi_hat,
pic_hat,
pix_hat,
w_hat,
c_hat,
i_hat,
mult_hat,
Pkprime_hat,
deltaS_hat,
H_hat,
kbar_hat,
k_hat,
q_hat,
mbar_hat,
mu_hat,
a_hat,
gammacd_hat,
gammaid_hat,
gammamcd_hat,
gammamid_hat,
gammaf_hat,
gammaxstar_hat,
x_hat,
mc_hat,
mcmc_hat,
mcmi_hat,
mcx_hat,
R_hat,
Rf_hat,
eps_hat,
muz_hat,
zetac_hat,
zetah_hat,
lambdaf_hat,
etamc_hat,
etami_hat,
phitilde_hat,
upsilon_hat,
tauk_hat,
tauy_hat,
tauc_hat,
tauw_hat,
g_hat,
epsR_hat,
pistar_hat,
ystar_hat,
Rstar_hat,
y_hat,
rk_hat,
lambdax_hat,
zetatilde_hat,
piT_hat,
data_pid, data_wp, data_c, data_i,     
data_R, data_y, data_x, data_m, data_pic, data_pii, 
data_ystar, data_pistar, data_Rstar, E_t, net_export_hat;% Gerret include E_t



varexo  eps_epshat, 	eps_muzhat, 	eps_nuhat, 	        eps_zetachat, 	    eps_zetahhat, 	eps_zetaqhat, 	eps_lambdafhat, 	
        eps_etamchat, 	eps_etamihat, 	eps_phitildehat, 	eps_upsilonhat, 	eps_taukhat,    eps_tauyhat, 	eps_tauchat, 	
        eps_tauwhat, 	eps_ghat, 	    eps_epsRhat,    	eps_pistarhat, 	    eps_ystarhat, 	eps_Rstarhat,   eps_lambdaxhat , eps_zetatildehat, eps_piThat, eps_muhat; 
   

parameters  Al,	Aq,	b,	beta,	cbar,	cdbar,	cdfbar,	csbar,	D1,	D2,	D3,	D4,	delta,	epspolicy,	epsz,	etac,	etaf,	etai,
            etamc,	etami,	gammacd,	gammacmc,	gammadc,	gammadi,	gammaf,	gammaid,	gammaimi,	gammamcd,	gammamid,	gammapi1,	
            gammapi2,	gammapi3,	gammaq1,	gammaq2,	gammaq3,	gammax, gammay1,	gammay2,	gammay3,	gbar,	Hbar,	ibar,	idbar,
            idfbar,	isbar,	kbar,	koverH,	lambdaf, lambdaw,	mbar,	mcbar,	mu,	muz,	nubar,	omegac,	omegai,	phi,	phitilde,	phiz,
            piebar, piecbar,	Pii1,	Pii2,	Pii3,	Piim,	Piimc,	PiimcPc,	Piimi,	PiimiPi,	PiiTot,	Pkprime,	qbar,	ratioc,	ratiog,	ratioi,	ratiox,	
            ratioz,	Rbar,	Rfbar,	rhoeps,	rhoetamc,	rhoetami,	rhoiota,	rholambda,	rhomuz,	rhonu,	rhophitilde,	rhoR,	rhozetac,	rhozetah,
            rhozetaq,	rkbar,	sharek,	sigmaa,	sigmal,	sigmaq,	SS,	tauc,	tauk,	tauw,	tauy,	wbar, xbar,	xid,	ximc, ximi,	xiw,	
            ybar,	ybar1,	ybar2,	ybar3,	zbar, bw,	eta0,	eta1,	eta2,	eta3,	eta4,   eta5,	eta6,	eta7,	eta8,	eta9, eta10, eta11, eta12, eta13, eta14, eta3bar,
            rhotauk,	rhotauy,	rhotauc,	rhotauw,	rhog,	rhoepsR,	rhopistar,	rhoystar,	rhoRstar, cmbar, imbar,
            rholambdax, rhozetatilde, xix, kappaw, kappad,rhopietarget,kappax,rdeltapi , rpie , rx , ry , rdeltay, kappamc , kappami, xie,phitildes,
            ForLag111 ,ForLag112 ,ForLag113 ,ForLag121 ,ForLag122 ,ForLag123 ,ForLag131 ,ForLag132 ,ForLag133 ,
            ForLag211 ,ForLag212 ,ForLag213 ,ForLag221 ,ForLag222 ,ForLag223 ,ForLag231 ,ForLag232 ,ForLag233 ,
            ForLag311 ,ForLag312 ,ForLag313 ,ForLag321 ,ForLag322 ,ForLag323 ,ForLag331 ,ForLag332 ,ForLag333 ,
            ForLag411 ,ForLag412 ,ForLag413 ,ForLag421 ,ForLag422 ,ForLag423 ,ForLag431 ,ForLag432 ,ForLag433,
            ForShock11 ,ForShock12 ,ForShock13 ,ForShock21 ,ForShock22 ,ForShock23 ,ForShock31 ,ForShock32 ,ForShock33,
            FisLag111 ,FisLag112 ,FisLag113 ,FisLag121 ,FisLag122 ,FisLag123 ,FisLag131 ,FisLag132 ,FisLag133 ,
            FisLag211 ,FisLag212 ,FisLag213 ,FisLag221 ,FisLag222 ,FisLag223 ,FisLag231 ,FisLag232 ,FisLag233 ,
            FisShock11, FisShock12, FisShock13, FisShock14, FisShock15, FisShock21, FisShock22, FisShock23, FisShock24, FisShock25,
            FisShock31, FisShock32, FisShock33, FisShock34, FisShock35, FisShock41, FisShock42, FisShock43, FisShock44, FisShock45,
            FisShock51, FisShock52, FisShock53, FisShock54, FisShock55,epstauk, epstauw,lambdamc,lambdami;% Phuong 27.06

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning the parameter their Bayesian estimates.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

phitildes       =	    0.606    ;
			
xiw             =	    0.765	;
xid             =	    0.825	;
ximc            =	    0.900	;
ximi            =	    0.939	;
xix             =	    0.874	;
kappad          =	    0.227	;
kappaw          =	    0.323	;
kappamc         =       0.2;     % p edit
kappami         =       0.3;     %kappad;
kappax          =       0.3;     %kappad;
SS              =	    8.584	;
b               =	    0.679	;
lambdaf         =	    1.195	;
etai            =	    2.715	;
etaf            =	    1.531	;
lambdamc        =	    1.584	;
lambdami        =	    1.134	;
muz             =	    1.0041	;
phitilde        =	    0.050	;
rhomuz          =	    0.845	;
rhoeps          =	    0.925	;
rhoiota         =	    0.694	;
rhophitilde     =	    0.684	;
rhozetac        =	    0.657	;
rhozetah        =	    0.270	;
rhozetatilde	=	    0.964	;



rhoR            =	    0.913	;
rpie            =	    1.674	;
rdeltapi        =	    0.098	;
rx              =	    -0.016	;
ry              =	    0.125	;
rdeltay         =	    0.178	;

//Calibr params 
sigmaq      =	10.62	;% real cash holding elasticity calibrated based on
                         % Adolfson (2007): 10.62
                         % Jaaskela and Nimark (2011): 10.62

sigmaa      =	0.049	;% capital utilisation cost,no variable capital utilization, other literatures, such as
                         % CEE (2005): 0.01
                         % Altig (2005): 11.42
                         % Adolfson (2007): 10^6 if the model is no variable capital utilization. They also calibrate 0.049
                         % Jaaskela and Nimark (2011): 0.049

nubar       =	1;   	 % share of wage in advance is calibrated based on literatures
                         % Adolfson (2007): 1
                         % Jaaskela and Nimark (2011): 0.95

etac        =	0.885;  % elasticity of substition  btw domestic goods and  foreign consumption goods
                        %Adoflson calibrate it as  5, but Phuong modify it as 0.885 as the average of 4 lituratures
                        % estimation of etac in other literatures, such as 
                        % Nimark (2009): 0.86
                        %Justininano and Preston (2010): 0.58; 
                        %Jaaskela and Nimark (2011): 1.301;
                        %Daniel, Smith and Hall (2016): 0.8

tauk        =	0	;// gover. Param, it is set as o then deriving the form as Altig (2005)and CEE(2005)
tauw        =	0   ;//0.3	govern. Parma Phuong 28.6;

%% set all markup shocks are the White Noise as Adofson..(2007)

rholambdax	=	0	; // persistent parameter of the markup export shock

rhoetamc	=	0	; // persistent parameter of the markup import in consumption goods shock

rhoetami	=	0	; // persistent parameter of the markup import in investment goods shock

rholambda	=	0	; // persistent parameter of the  domestic markup shock
%.........................................................................




% Goverment parameters....................................................
rdeltax     =	0	;// govern. pram
rhotauk     =	0   ;// govern. parm Phuong 28,6 0.9	;
rhotauw     =	0   ;// govern. pram Phuong 28.6 0.9	;
epstauk     =	0   ;// govern. pram Phuong 28.6 1	;
epstauw     =	0   ;// govern. pram Phuong 28.6 1	;
%.........................................................................
muz         =	    1.0041;
mu          =	1.01	;//Money growth rate,pg modified
beta        =	0.999	;// Pg bases on Justiniano & Preston (2010). This calibrated param. is not so diff
                         // such as, Jaaskela and Nimark (2011): 0.999
                          //Daniel, Smith and Hall (2016):0.9996
                         // Li & Spencer (2016): 0.9868

sigmal      =	1	;// labor suppy elasticity,This calibration is common in literatures, such as
                    // CEE(2005);Gali and Monacelli (2005); Adoflson..(2007), and
                    // in AUS lituratures, such as Jaaskela and Nimark (2011),Daniel, Smith and Hall (2016)
                    //Justiniano & Preston (2010)estimated the inverse elastictiy of labor suppply of 1.12
                    // but poorly identified in DSGE model with a big confident interval
                    // it implies that the elasticity of labor supply is 1/1.12 equals to 0.89
                   // not so diffent from 1

delta       =	0.013;%0.0175	;// depreciation rate, png modify according to AUS
                        //Jaaskela and Nimark (2011):0.013
                        //Daniel, Smith and Hall (2016): 0.0175, which is around the average value of this param. in Aus national accounts

sharek      =	0.25;%0.29	; //share of capital in production function, some literatures related to AUS,such as
                          //Jaaskela and Nimark (2011): 0.29 as Adolfson..(2007)
                           //Daniel, Smith and Hall (2016):0.25

lambdaw     =	1.05	;// wage markup, no modification is needed 
                        //Jaaskela and Nimark (2011):1.05 as CEE(2005); Adofson..(2007)

ratiog      =	0; // govern. pram pg modify 28,60.3	;

omegac      =	0.2;%0.2 is standard	; % share of import in consumption, Jaaskela and Nimark (2011):0.2
omegai      =	0.5	;%0.5 is standard // share of import in investment, Jaaskela and Nimark (2011):0.5

tauy        =	0; // govern. pram 0.3	; //Pg 28.6
tauc        =	0; // govern. pram 0.24; //Pg 28.6

Al          =	6.5	; //labor disutility param., Pg modify based on literatures, such as
                      % Adoflson..(2007): 6.5
                      %Jaaskela and Nimark (2011): 7.5

Aq          =	0.1	;// Cash in Utility function parm.,
                      % Adoflson..(2007): 0.1
                      % Jaaskela and Nimark (2011): 0.38

%%No role in the model................................................
gammaf      =	1	;
gammapi1	=	0	;
gammaq1     =	0	;
gammaq3     =	0	;
%.........................................................................

rhoepsR     =	0	; % the persistent parameter in monetary policy shock process
gammay1     =	0	; % no role

rhopietarget	=	0.975	; %  Smet & Woulter (2003):1
                              % Adoflson..(2007): 0.975

rhonu       =	0	; % no role
rhozetaq	=	0	; % no role
epsmdfi     =	0	; % no role
epsmdhh     =	0	; % no role
xie         =   0.7975   ; // 0 //  change made by Gerret from 0 to 0.7975, 27.06.2017


//m-file with the VAR-par
ForFisEstRes_Pmod; 
//Params to Foreign VAR
//Lag 1
ForLag111 = A1_for(1,1);
ForLag112 = A1_for(1,2);
ForLag113 = A1_for(1,3);
ForLag121 = A1_for(2,1);
ForLag122 = A1_for(2,2);
ForLag123 = A1_for(2,3);
ForLag131 = A1_for(3,1);
ForLag132 = A1_for(3,2);
ForLag133 = A1_for(3,3);
//Lag 2
ForLag211 = A2_for(1,1);
ForLag212 = A2_for(1,2);
ForLag213 = A2_for(1,3);
ForLag221 = A2_for(2,1);
ForLag222 = A2_for(2,2);
ForLag223 = A2_for(2,3);
ForLag231 = A2_for(3,1);
ForLag232 = A2_for(3,2);
ForLag233 = A2_for(3,3);
//Lag 3
ForLag311 = A3_for(1,1);
ForLag312 = A3_for(1,2);
ForLag313 = A3_for(1,3);
ForLag321 = A3_for(2,1);
ForLag322 = A3_for(2,2);
ForLag323 = A3_for(2,3);
ForLag331 = A3_for(3,1);
ForLag332 = A3_for(3,2);
ForLag333 = A3_for(3,3);
//Lag 4
ForLag411 = A4_for(1,1);
ForLag412 = A4_for(1,2);
ForLag413 = A4_for(1,3);
ForLag421 = A4_for(2,1);
ForLag422 = A4_for(2,2);
ForLag423 = A4_for(2,3);
ForLag431 = A4_for(3,1);
ForLag432 = A4_for(3,2);
ForLag433 = A4_for(3,3);
//For Shock
ForShock11 = B0_for(1,1);
ForShock12 = B0_for(1,2);
ForShock13 = B0_for(1,3);
ForShock21 = B0_for(2,1);
ForShock22 = B0_for(2,2);
ForShock23 = B0_for(2,3);
ForShock31 = B0_for(3,1);
ForShock32 = B0_for(3,2);
ForShock33 = B0_for(3,3);

// Pg 27.06
//Params to Fiscal VAR
//Lag 1
FisLag111 = A1_fis(1,1);
FisLag112 = A1_fis(1,2);
FisLag113 = A1_fis(1,3);
FisLag121 = A1_fis(2,1);
FisLag122 = A1_fis(2,2);
FisLag123 = A1_fis(2,3);
FisLag131 = A1_fis(3,1);
FisLag132 = A1_fis(3,2);
FisLag133 = A1_fis(3,3);
//Lag 2
FisLag211 = A2_fis(1,1);
FisLag212 = A2_fis(1,2);
FisLag213 = A2_fis(1,3);
FisLag221 = A2_fis(2,1);
FisLag222 = A2_fis(2,2);
FisLag223 = A2_fis(2,3);
FisLag231 = A2_fis(3,1);
FisLag232 = A2_fis(3,2);
FisLag233 = A2_fis(3,3);
//Fis Shock
FisShock11 = B0_fis(1,1);     //tauk
FisShock12 = B0_fis(1,2);     //tauy
FisShock13 = B0_fis(1,3);     //tauc
FisShock14 = B0_fis(1,4);     //tauw
FisShock15 = B0_fis(1,5);     //g_gap
FisShock21 = B0_fis(2,1);
FisShock22 = B0_fis(2,2);
FisShock23 = B0_fis(2,3);
FisShock24 = B0_fis(2,4);
FisShock25 = B0_fis(2,5);
FisShock31 = B0_fis(3,1);
FisShock32 = B0_fis(3,2);
FisShock33 = B0_fis(3,3);
FisShock34 = B0_fis(3,4);
FisShock35 = B0_fis(3,5);
FisShock41 = B0_fis(4,1);
FisShock42 = B0_fis(4,2);
FisShock43 = B0_fis(4,3);
FisShock44 = B0_fis(4,4);
FisShock45 = B0_fis(4,5);
FisShock51 = B0_fis(5,1);
FisShock52 = B0_fis(5,2);
FisShock53 = B0_fis(5,3);
FisShock54 = B0_fis(5,4);
FisShock55 = B0_fis(5,5);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





model(linear);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//EXOGENOUS VARIABLES (The exog vars in Dynare are really the innovations to the exog vars below)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Stationary technology
eps_hat         = rhoeps*eps_hat(-1)            + eps_epshat;
//Nonstationary technology 
muz_hat         = rhomuz*muz_hat(-1)            + eps_muzhat;
//Firm money demand chock
//nu_hat          = 0;
//Consumption preference
zetac_hat       = rhozetac*zetac_hat(-1)        + eps_zetachat;
//Labor supply 
zetah_hat       = rhozetah*zetah_hat(-1)        + eps_zetahhat;
//Household money demand
//zetaq_hat       = 0;
//Domestic markup
lambdaf_hat     = rholambda*lambdaf_hat(-1)     + eps_lambdafhat;
//Substitution elasticity imp cons goods
etamc_hat       = rhoetamc*etamc_hat(-1)        + eps_etamchat;
//Substitution elasticity imp inv goods
etami_hat       = rhoetami*etami_hat(-1)        + eps_etamihat;
//Risk premium
phitilde_hat    = rhophitilde*phitilde_hat(-1)  + eps_phitildehat;
//Investment specific technology
upsilon_hat     = rhoiota*upsilon_hat(-1)       + eps_upsilonhat;
//Monetary policy
epsR_hat        = rhoepsR*epsR_hat(-1)          + eps_epsRhat;
//Markup export
lambdax_hat     = rholambdax*lambdax_hat(-1)    + eps_lambdaxhat;
//Asymmetric technology
zetatilde_hat   = rhozetatilde*zetatilde_hat(-1)+ eps_zetatildehat;
//Inflation target
piT_hat         = rhopietarget*piT_hat(-1)      + eps_piThat;

//Foreign VAR
 pistar_hat  = ForLag111*pistar_hat(-1)  + ForLag112*ystar_hat(-1) + ForLag113*Rstar_hat(-1)  
             +ForLag211*pistar_hat(-2)  + ForLag212*ystar_hat(-2) + ForLag213*Rstar_hat(-2) 	
             +ForLag311*pistar_hat(-3)  + ForLag312*ystar_hat(-3) + ForLag313*Rstar_hat(-3) 
      		+ForLag411*pistar_hat(-4)  + ForLag412*ystar_hat(-4) + ForLag413*Rstar_hat(-4) + ForShock11*eps_pistarhat + ForShock12*eps_ystarhat + ForShock13*eps_Rstarhat ;
 
 ystar_hat = ForLag121*pistar_hat(-1)  + ForLag122*ystar_hat(-1) + ForLag123*Rstar_hat(-1)  
             +ForLag221*pistar_hat(-2)  + ForLag222*ystar_hat(-2) + ForLag223*Rstar_hat(-2) 	
             +ForLag321*pistar_hat(-3)  + ForLag322*ystar_hat(-3) + ForLag323*Rstar_hat(-3) 
      		+ForLag421*pistar_hat(-4)  + ForLag422*ystar_hat(-4) + ForLag423*Rstar_hat(-4) + ForShock21*eps_pistarhat + ForShock22*eps_ystarhat + ForShock23*eps_Rstarhat ;
 
 Rstar_hat  = ForLag131*pistar_hat(-1)  + ForLag132*ystar_hat(-1) + ForLag133*Rstar_hat(-1)  
             +ForLag231*pistar_hat(-2)  + ForLag232*ystar_hat(-2) + ForLag233*Rstar_hat(-2) 	
             +ForLag331*pistar_hat(-3)  + ForLag332*ystar_hat(-3) + ForLag333*Rstar_hat(-3) 
      		+ForLag431*pistar_hat(-4)  + ForLag432*ystar_hat(-4) + ForLag433*Rstar_hat(-4) + ForShock31*eps_pistarhat + ForShock32*eps_ystarhat + ForShock33*eps_Rstarhat ;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ENDOGENOUS VARIABLES
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

pid_hat = piT_hat + (beta/(1+kappad*beta))*(pid_hat(+1) - rhopietarget*piT_hat) +  (kappad/(1+kappad*beta))*(pid_hat(-1) - piT_hat) 
            + (((1-xid)*(1-beta*xid))/(xid*(1+kappad*beta)))*( mc_hat) + lambdaf_hat   
            -(kappad*beta*(1-rhopietarget)/(1+kappad*beta))*piT_hat ;

pimc_hat = piT_hat + (beta/(1+kappamc*beta))*(pimc_hat(+1) - rhopietarget*piT_hat) +  (kappamc/(1+kappamc*beta))*(pimc_hat(-1) - piT_hat) 
            + (((1-ximc)*(1-beta*ximc))/(ximc*(1+kappamc*beta)))*( mcmc_hat )+ etamc_hat
            -(kappamc*beta*(1-rhopietarget)/(1+kappamc*beta))*piT_hat ;

pimi_hat = piT_hat + (beta/(1+kappami*beta))*(pimi_hat(+1) - rhopietarget*piT_hat) +  (kappami/(1+kappami*beta))*(pimi_hat(-1) - piT_hat) 
            + (((1-ximi)*(1-beta*ximi))/(ximi*(1+kappami*beta)))*( mcmi_hat)  + etami_hat  
            -(kappami*beta*(1-rhopietarget)/(1+kappami*beta))*piT_hat ;

pic_hat = ((1-omegac)*((( (1-omegac) + omegac*((lambdamc/(lambdamc-1))/((lambdamc/(lambdamc-1))-1))^(1-etac) )^(1/(1-etac))))^(-(1-etac)))*pid_hat  +  ((omegac)*((( (1-omegac)*(((lambdamc/(lambdamc-1))-1)/(lambdamc/(lambdamc-1)))^(1-etac) + omegac )^(1/(1-etac))))^(-(1-etac)))*pimc_hat;

pix_hat = piT_hat + (beta/(1+kappax*beta))*(pix_hat(+1) - rhopietarget*piT_hat) +  (kappax/(1+kappax*beta))*(pix_hat(-1) - piT_hat) 
            + (((1-xix)*(1-beta*xix))/(xix*(1+kappax*beta)))*( mcx_hat)  + lambdax_hat  
            -(kappax*beta*(1-rhopietarget)/(1+kappax*beta))*piT_hat ; % Phuong modify

w_hat = -(1/(sigmal*lambdaw - bw*(1+beta*(xiw^2))))*((((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*xiw)*w_hat(-1) 
+ (((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*beta*xiw)*w_hat(+1) 
+ (-((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*xiw)*pid_hat 
+ (((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*beta*xiw)*pid_hat(+1) 
+ (((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*kappaw*xiw)*pic_hat(-1) 
+ (-((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*beta*kappaw*xiw)*pic_hat 
- ((-((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*xiw) 
+ rhopietarget*(((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*beta*xiw) 
+ (((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*kappaw*xiw) 
+ rhopietarget*(-((lambdaw*sigmal - (1-lambdaw))/((1-beta*xiw)*(1-xiw)))*beta*kappaw*xiw))*piT_hat
+ (1-lambdaw)*mult_hat 
+ (-(1-lambdaw)*sigmal)*H_hat 
+ (-(1-lambdaw)*(tauy/(1-tauy)))*tauy_hat 
+ (-(1-lambdaw)*(tauw/(1+tauw)))*tauw_hat) 
- zetah_hat;    % p modi (-(1-lambdaw))*zetah_hat )                                       
                   
c_hat = -(1/(muz^2 + beta*b^2))*(-b*beta*muz*c_hat(+1) -b*muz*c_hat(-1) + b*muz*(muz_hat - beta*muz_hat(+1)) 
        +(muz-b*beta)*(muz-b)*mult_hat + (tauc/(1+tauc))*(muz-b*beta)*(muz-b)*tauc_hat + (muz-b*beta)*(muz-b)*gammacd_hat)
        -zetac_hat ;% Phuong modify 31.8
     
i_hat = (1/((SS*muz^2)*(1+beta)))*((SS*muz^2)*(i_hat(-1) + beta*i_hat(+1) - muz_hat + beta*muz_hat(+1)) + Pkprime_hat +  upsilon_hat - gammaid_hat );

mult_hat = mult_hat(+1) - muz_hat(+1) + (1/mu)*(mu - beta*tauk)*R_hat - pid_hat(+1) + (1/mu)*(tauk/(1-tauk))*(beta - mu)*tauk_hat(+1);

Pkprime_hat = -mult_hat - muz_hat(+1) + mult_hat(+1) + (beta*(1-delta)/muz)*Pkprime_hat(+1) - (tauk/(1-tauk))*((muz-beta*(1-delta))/muz)*tauk_hat(+1) 
              + ((muz-beta*(1-delta))/muz)*rk_hat(+1);

(1-phitildes)*deltaS_hat(+1) - phitildes*deltaS_hat - (R_hat - Rstar_hat) - phitilde*a_hat + phitilde_hat = 0;

 H_hat*(lambdaf*(1-sharek)) = ((1-omegac)*((( (1-omegac) + omegac*((lambdamc/(lambdamc-1))/((lambdamc/(lambdamc-1))-1))^(1-etac) )^(1/(1-etac)))^etac)*(cbar/ybar)*(c_hat + etac*gammacd_hat) 
                                    +(1-omegai)*((( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^etai)*(ibar/ybar)*(i_hat + etai*gammaid_hat)
                                    +(gbar/ybar)*g_hat
                                    +((gammaf^etaf)*xbar/ybar)*(ystar_hat - etaf*gammaxstar_hat + zetatilde_hat)
                                    +(1-tauk)*rkbar*(kbar/ybar)*(1/muz)*(k_hat-kbar_hat(-1))
                                    -lambdaf*eps_hat
                                    -lambdaf*sharek*(k_hat-muz_hat) );                                    

                                  
kbar_hat = (1-delta)*(1/muz)*kbar_hat(-1) - (1-delta)*(1/muz)*muz_hat + (1-(1-delta)*(1/muz))*upsilon_hat + (1-(1-delta)*(1/muz))*i_hat;

k_hat = kbar_hat(-1) + (1/sigmaa)*rk_hat - (1/sigmaa)*(tauk/(1-tauk))*tauk_hat; %deriving from the utilisation rate r(t)=K(t)/KBar(t)

q_hat = (1/sigmaq)*((tauk/(1-tauk))*tauk_hat - mult_hat - (Rbar/(Rbar-1))*R_hat(-1));

mbar_hat(-1) = mbar_hat + pid_hat + muz_hat - mu_hat;

((mu*mbar)/(piebar*muz))*mu_hat = -((mu*mbar)/(piebar*muz))*mbar_hat(-1) + ((mu*mbar)/(piebar*muz))*pid_hat + ((mu*mbar)/(piebar*muz))*muz_hat  
                                  +qbar*q_hat + nubar*wbar*Hbar*( w_hat + H_hat);

                                  
a_hat = -xbar*mcx_hat - etaf*xbar*gammaxstar_hat + xbar*ystar_hat + xbar*zetatilde_hat
        +(cmbar + imbar)*gammaf_hat 
        -(cmbar*(c_hat - etac*(1-omegac)*((( (1-omegac) + omegac*((lambdamc/(lambdamc-1))/((lambdamc/(lambdamc-1))-1))^(1-etac) )^(1/(1-etac)))^(-(1-etac)))*gammamcd_hat) + imbar*(i_hat - etai*(1-omegai)*((( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^(-(1-etai)))*gammamid_hat))
        + (Rbar/(piebar*muz))*a_hat(-1); 
                                 
Rf_hat = (nubar*Rbar/(nubar*Rbar+1-nubar))*R_hat(-1);

rk_hat = muz_hat + w_hat + Rf_hat + H_hat - k_hat;

mc_hat = sharek*(muz_hat + H_hat - k_hat) + w_hat + Rf_hat - eps_hat;

gammacd_hat = omegac*((( (1-omegac)*(((lambdamc/(lambdamc-1))-1)/(lambdamc/(lambdamc-1)))^(1-etac) + omegac )^(1/(1-etac)))^(-(1-etac)))*gammamcd_hat;

gammaid_hat = omegai*((( (1-omegai)*(((lambdami/(lambdami-1))-1)/(lambdami/(lambdami-1)))^(1-etai) + omegai )^(1/(1-etai)))^(-(1-etai)))*gammamid_hat;

gammamcd_hat = gammamcd_hat(-1) + pimc_hat - pid_hat;

gammamid_hat = gammamid_hat(-1) + pimi_hat - pid_hat;

gammaf_hat = mcx_hat + gammaxstar_hat;

gammaxstar_hat = gammaxstar_hat(-1) + pix_hat - pistar_hat;

x_hat =  -omegac*(( (1-omegac)*(((lambdamc/(lambdamc-1))-1)/(lambdamc/(lambdamc-1)))^(1-etac) + omegac )^(1/(1-etac)))^(-(1-etac))*gammamcd_hat - gammaxstar_hat - mcx_hat;

mcmc_hat = - mcx_hat - gammaxstar_hat - gammamcd_hat;

mcmi_hat = - mcx_hat - gammaxstar_hat - gammamid_hat;

mcx_hat = mcx_hat(-1) + pid_hat - pix_hat - deltaS_hat;

// Phuong 27.7
tauk_hat=0;
tauw_hat=0;
tauy_hat=0;
tauc_hat=0;
g_hat=0;

//Smets & Wouters Rule
R_hat = rhoR*R_hat(-1) + (1-rhoR)*(piT_hat  + rpie*(pic_hat(-1) - piT_hat) + ry*y_hat(-1) + rx*x_hat(-1) ) + rdeltapi*(pic_hat-pic_hat(-1)) 
        +rdeltay*(y_hat-y_hat(-1))  + epsR_hat; 

      
y_hat = lambdaf*((1-sharek)*H_hat + sharek*k_hat - sharek*muz_hat + eps_hat ) ;

// *** Measurement equations **/

data_pid = 400*(piebar-1)*piebar + 4*piebar*pid_hat;

data_wp = 100*log(muz) + w_hat-w_hat(-1) + muz_hat;

data_c = 100*log(muz) + c_hat-c_hat(-1) 
      + (cbar/(cdbar+cmbar))*etac*(cdbar/cbar)*(cmbar/cbar)*( ((( (1-omegac)*(((lambdamc/(lambdamc-1))-1)/(lambdamc/(lambdamc-1)))^(1-etac) + omegac )^(1/(1-etac)))^-1) - ((( (1-omegac) + omegac*((lambdamc/(lambdamc-1))/((lambdamc/(lambdamc-1))-1))^(1-etac) )^(1/(1-etac)))^-1) )*(gammamcd_hat-gammamcd_hat(-1)) + muz_hat;

data_i = 100*log(muz) + i_hat-i_hat(-1)
      + (ibar/(idbar+imbar))*etai*(idbar/ibar)*(imbar/ibar)*( ((( (1-omegai)*(((lambdami/(lambdami-1))-1)/(lambdami/(lambdami-1)))^(1-etai) + omegai )^(1/(1-etai)))^-1) - ((( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^-1) )*(gammamid_hat-gammamid_hat(-1)) 
      +  (1-tauk)*rkbar*kbar*(1/muz)*((k_hat - kbar_hat) - (k_hat(-1) - kbar_hat(-1)) ) 
      + muz_hat ;

data_R = 400*(Rbar-1)*Rbar + 4*Rbar*R_hat; 

data_y = 100*log(muz) + y_hat-y_hat(-1) + muz_hat;

data_x = 100*log(muz) + ystar_hat-ystar_hat(-1) - etaf*(gammaxstar_hat-gammaxstar_hat(-1)) + zetatilde_hat-zetatilde_hat(-1) + muz_hat;

data_m = 100*log(muz) + (cmbar/(cmbar+imbar))*(c_hat-c_hat(-1)) 
      - (cmbar/(cmbar+imbar))*(etac*(1-omegac)*(( (1-omegac) + omegac*((lambdamc/(lambdamc-1))/((lambdamc/(lambdamc-1))-1))^(1-etac) )^(1/(1-etac)))^(-(1-etac)))*(gammamcd_hat-gammamcd_hat(-1))
      + (imbar/(cmbar+imbar))*(i_hat-i_hat(-1)) 
      - (imbar/(cmbar+imbar))*(etai*(1-omegai)*(( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^(-(1-etai)))*(gammamid_hat-gammamid_hat(-1))
      + muz_hat;
net_export_hat = data_x - data_m; // P modified by adding net_export_hat
data_pic = 400*(piebar-1)*piebar + 4*piebar*pic_hat + 4*piebar*(tauc/(1+tauc))*(tauc_hat - tauc_hat(-1));

data_pii = 400*(piebar-1)*piebar 
           + 4*piebar*(idbar/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar)
- (etai*omegai*(((( (1-omegai)*(((lambdami/(lambdami-1))-1)/(lambdami/(lambdami-1)))^(1-etai) + omegai )^(1/(1-etai))))^(-(1-etai)))*((idbar/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar))-idbar/(idbar+imbar))
-etai*(1-omegai)*((( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^(-(1-etai)))*(((((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar)/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar))-imbar/(idbar+imbar))) )*pid_hat           
+ 4*piebar*( (((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar)/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar)
+ etai*omegai*(((( (1-omegai)*(((lambdami/(lambdami-1))-1)/(lambdami/(lambdami-1)))^(1-etai) + omegai )^(1/(1-etai))))^(-(1-etai)))* ((idbar/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar))-idbar/(idbar+imbar)) 
- etai*(1-omegai)*((( (1-omegai) + omegai*((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))^(1-etai) )^(1/(1-etai)))^(-(1-etai)))*(((((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar)/(idbar+((lambdami/(lambdami-1))/((lambdami/(lambdami-1))-1))*imbar))-imbar/(idbar+imbar)) )*pimi_hat;

data_ystar = 100*log(muz) + ystar_hat-ystar_hat(-1) + zetatilde_hat-zetatilde_hat(-1) + muz_hat;

data_pistar = 400*(piebar-1)*piebar + 4*piebar*pistar_hat;

data_Rstar = 400*(Rbar-1)*Rbar + 4*Rbar*Rstar_hat;

E_t = beta/(1+beta)*E_t(+1)+(1/(1+beta))*E_t(-1)+((1-xie)*(1-beta*xie))/((1+beta)*xie)*(H_hat-E_t); // change made by Gerret, 27.06.2017 becasue swedish data has no data about employment
end;

// *** Observed data ***

% Gerret & Pg, working on this
varobs data_pid data_wp data_c data_i x_hat
data_R E_t data_y data_x data_m data_pic 
data_ystar data_pistar data_Rstar;

steady;
check;

shocks;
//Stationary technology 
%var eps_epshat = (epsteche)^2;

//Nonstationary technology 
%var eps_muzhat = (epstechz)^2;

//Consumption preference
%var eps_zetachat = (epszetac)^2;

//Labor supply
%var eps_zetahhat = (epszetah)^2;

//Domestic markup
%var eps_lambdafhat = (epslf)^2;

//Substitution elasticity imp cons goods
%var eps_etamchat = (epsetamc)^2;

//Substitution elasticity imp inv goods
%var eps_etamihat = (epsetami)^2;

//Risk premium
%var eps_phitildehat = (epsphiex)^2;

//Investment specific technology
%var eps_upsilonhat = (epsu)^2;

//Monetary policy
var eps_epsRhat =0.0894 ;

//Markup export
%var eps_lambdaxhat = (epslx)^2;

//Asymmetric technology
%var eps_zetatildehat = (epszstar)^2;

//Inflation target
%var eps_piThat = (epspiebar)^2;

//Foreign VAR
var eps_pistarhat = (1)^2;
var eps_ystarhat  = (1)^2;
var eps_Rstarhat  = (1)^2;

//Fiscal VAR P 27.7
var eps_taukhat = (0)^2;
var eps_tauwhat = (0)^2;
var eps_tauchat = (0)^2;
var eps_tauyhat = (0)^2; 
var eps_ghat    = (0)^2; 
end; 

// *** Prior distribution: ***
estimated_params; 
//use [s,nu]=inverse_gamma_specification(0.002,inf,1) to verify that 
//stdev=inf  yields indeed 2 degrees of freedom
//MA: wrong prior for truncnormal and invgamma > 4df

%-------Calvo parameters block (nominal friction)--------------------------------------
%------probability that a firm/household is not allowed to reoptimise price/wage---
xiw,,,,        beta_pdf,0.675,0.05;  % Calvo wage
xid,,,,        beta_pdf,0.675,0.05;  % Calvo domestic price
ximc,,,,       beta_pdf,0.675,0.05;  % Calvo import consumption price
ximi,,,,       beta_pdf,0.675,0.05;  % Calvo import investment price
xix,,,,        beta_pdf,0.675,0.05;  % Calvo export price
xie,,,,        beta_pdf,0.675,0.05;  % Calvo unemployment


%------------price and wage indexations (nominal friction)--------------- 
kappad,,,,       beta_pdf,0.5,0.15; % Indexation prices for domestic firm
kappaw,,,,       beta_pdf,0.5,0.15; % Indexation wages
kappamc,,,,       beta_pdf,0.5,0.15; % Indexation prices for importing cons. firm
kappami,,,,       beta_pdf,0.5,0.15; % Indexation prices for importing inves. firm
kappax,,,,       beta_pdf,0.5,0.15; % Indexation prices for exporting firm 

%-------------------------------------------------------------------------

%------------Real frictions----------------------------------------------
 
SS,,,,         normal_pdf,7.694,1; % Investment adjustment cost, initial value: 1.5, 1 (fine, saving mod file)
b,,,,          beta_pdf,0.65,0.2;    % Consumption habit formation
%-------------------------------------------------------------------------

%------------------3 Markups-----------------------------------------------

lambdaf,,,,        normal_pdf,1.2,0.05;      % Markup demestic
lambdamc,,1.01,,   normal_pdf,1.2,0.05;      % Markup imported consumption
lambdami,,1.01,,   normal_pdf,1.2,0.05;      % Markup imported invesment
%---------------------------------------------------------------------

%------------Substitution of elasticity------------------------------- 
etai,,,,       inv_gamma_pdf,1.5,inf;  % Subst. elasticity investment
etaf,,,,       inv_gamma_pdf,1.5,inf;  % Subst. elasticity foreign
%-------------------------------------------------------------------------

%muz,,,,        normal_pdf,1.0041,0.0005;   % Technolog growth is calibrated at the steady state output growth

phitilde,,,,   inv_gamma_pdf,0.01,inf;   % Risk premium
phitildes,,,,  beta_pdf,0.5,0.15;      % UIP modification

//------ 6 parameters in policy rule----------------- 
rhoR,,,,    beta_pdf,0.8,0.05;            % Interest Rate smoothing
rpie,,,,    normal_pdf,1.8,0.2;         % Inflation response
rdeltapi,,,, normal_pdf,0.3,0.05;       % Diff. Inflation response
rx,,,, normal_pdf,0.01,0.05;             % 0.00 as prior mean, Real exchange rate response
ry,,,, normal_pdf,0.125,0.05;             %0.05;  Output response
rdeltay,,,, normal_pdf,0.0625,0.05;        % Diff. output response
%---------------------------------------------------------------------

%---------------------SHOCK PROCESS---------------------------

%---persistent paramters in AR process------------------------------------

rhomuz,,,,     beta_pdf,0.85,0.1;      % Unit root tech.shock
rhoeps,,,,     beta_pdf,0.85,0.1;      % Stationary tech. shock
rhoiota,,,,    beta_pdf,0.85,0.15;      % Unit root Investment specific technology shock
rhophitilde,,,,beta_pdf,0.85,0.1;      % Unit root Risk premium shock
rhozetac,,,,   beta_pdf,0.85,0.1;      % Consumption preference
rhozetah,,,,   beta_pdf,0.85,0.1;      % Labor supply
rhozetatilde,,,,   beta_pdf,0.85,0.1;  % Unit root Asymmetric technology shock
%-------------------------------------------------------------------------



%stderr eps_muzhat,,,,   inv_gamma_pdf,0.2,inf;             % Non-stationary Technology shock

stderr eps_epshat,,,,   inv_gamma_pdf,0.7,inf;             % Stationary technology shock
stderr eps_etamchat,,,,   inv_gamma_pdf,1,inf;             % Substitution elasticity imp cons goods shock
stderr eps_etamihat,,,,   inv_gamma_pdf,1,inf;             % Substitution elasticity imp inv goods shock
stderr eps_lambdafhat,,,,   inv_gamma_pdf,1,inf;           % Domestic markup shock
stderr eps_upsilonhat,,,,   inv_gamma_pdf,0.2,inf;         % Investment specific technology shock
stderr eps_phitildehat,,,,   inv_gamma_pdf,0.05,inf;       % Risk premium shock
stderr eps_zetachat,,,,   inv_gamma_pdf,0.2,inf;           % Consumption preference shock phuong modify
stderr eps_zetahhat,,,,   inv_gamma_pdf,1,inf;             % Labor supply shock, phuong modify stderr eps_zetahhat,,,,   inv_gamma_pdf,1.0*527.1575,inf
stderr eps_zetatildehat,,,,   inv_gamma_pdf,0.4,inf;       % Asymmetric technology
stderr eps_lambdaxhat,,,,   inv_gamma_pdf,1,inf;           % Markup export shock
stderr eps_epsRhat,,,,   inv_gamma_pdf,0.15,inf;           % Interest rate Shock
stderr eps_piThat,,,,   inv_gamma_pdf,0.05,inf;            % Inflation Target Shock

end;



//options_.aim_solver=1;
//identification(ar=1,useautocorr=0,prior_mc =50); // no idetification problem
//identification(ar=10); //P no idetification problem

estimation(
datafile=Trans_Aus_Dat_dynare_rw,
//xls_range=A2:N61,
//nobs =60,
//first_obs=60,
plot_priors=0, % default =1
mode_compute=9,%4 (Chris Sim), 7 ( fminsearch Nelder-Mead 1965), 9 (Covariance Matrix Adaptation Evolution Strategy) algorithm of Hansen and Kern (2004))
%optim =('MaxIter',50000,'MaxFunEvals',50000),
mh_replic= 250000,      % THE MOST IMPORTANCE. Number of draws for each Makov chain. Default: 20,000
mh_nblocks = 1,   % THE MOST IMPORTANCE. Number of parallel chains for Metropolis-Hasting Algorithm (Default=2, very low). it should be at least 5
mh_drop = 0.45,    % the number of burn-in. default =0.5
mh_jscale = 0.25,  % THE MOST IMPORTANCE. The scale for jumping distribution in the MH algorithm (default =0.2, rarely satisfactory)
                  % this scale must be tunned to make sure the acceptance rate ranging btw 0.2 and 0.4
                  % when Phuong set the jumping scale of 0.2 as a default number, then the acceptance ratio is
                  % over 0.4 (too high in comparison to literature only 0.2 and 0.4)
                  % that's why P increase the jump scale from default level of 0.2 to 0.3
                  % as a result, the acceptance ratio lies on the range btw 0.2 and 0.4
                  % the rule to adjust the jumping scale (c)
                  % if the acceptance ratio (R) is TOO LOW, then the jumping scale (c) should be REDUCED (WHY?)
                  % if the acceptance ratio (R) is TOO HIGH, then the jumping scale (c) should be INCREASED (WHY?)
%mh_init_scale=1 , % Like An & Schorfheide (2007)to generate a starting value for MH


//load_mh_file,  % VERY USEFUL TO SPEED UP.By loading the previuos MH simulation
mode_file=ALEstim_pet_mode, % to use the previous likelihood result
mode_check_neighbourhood_size =1000,
diffuse_filter, % to stationanize data
//mode_check
//lik_init=1,      
//nograph=0
forecast=4)data_pid data_wp data_c data_i data_R E_t data_y data_pic;
