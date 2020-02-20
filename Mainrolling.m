clear all; close all; clc;

datafull = xlsread('Trans_Aus_Dat_dynare.xls','Trans_Aus_Dat','A2:N93');
T =length(datafull(:,1));
bw =1;
ew =60;
hmax=4; % 
nr_window = (T - hmax) - ew + 1;

forcast_pi_obs=zeros(nr_window,4);
forcast_wp_obs=zeros(nr_window,4);
forcast_c_obs=zeros(nr_window,4);
forcast_i_obs=zeros(nr_window,4);
forcast_r_obs=zeros(nr_window,4);
forcast_E_obs=zeros(nr_window,4);
forcast_y_obs=zeros(nr_window,4);
forcast_pic_obs=zeros(nr_window,4);

fems_pi=zeros(nr_window,4);
fems_wp=zeros(nr_window,4);
fems_c=zeros(nr_window,4);
fems_i=zeros(nr_window,4);
fems_R=zeros(nr_window,4);
fems_E=zeros(nr_window,4);
fems_y=zeros(nr_window,4);
fems_pic=zeros(nr_window,4);

nowindow=zeros(nr_window,2);
% fems_y=zeros(nr_window,4); 
% fems_R=zeros(nr_window,4); 
% fems_pi=zeros(nr_window,4); 


%% for Rolling Window
while  ew <= T - hmax

nowindow(bw,1)=bw;
nowindow(bw,2)=ew; 
save('nowindow','nowindow','-ascii','-double');

data_current_window=datafull(bw:ew,:); % cut data to required window

filename = 'Trans_Aus_Dat_dynare_rw.xlsx';

names = {'data_pid','data_wp','data_c',...
    'data_i','x_hat','data_R','E_t','data_y',...
    'data_x','data_m','data_pic','data_ystar',...
    'data_pistar','data_Rstar'};
 xlswrite(filename,data_current_window, 'Sheet1', 'A2');
%  %xlswrite(filename, exdata, 'data', 'A2');
 xlswrite(filename, names, 'Sheet1', 'A1');
%save('wdata.mat','data_current_window'); %save dat

dynare ALEstim_pet noclearall 
filefems = 'fems_rw.xlsx';

for i=1:hmax
    
forcast_pi_obs(bw,i) =oo_.PointForecast.Mean.data_pid(i);
forcast_wp_obs(bw,i) =oo_.PointForecast.Mean.data_wp(i);
forcast_c_obs(bw,i)  =oo_.PointForecast.Mean.data_c(i);
forcast_i_obs(bw,i)  =oo_.PointForecast.Mean.data_i(i);
forcast_r_obs(bw,i)  =oo_.PointForecast.Mean.data_R(i);
forcast_E_obs(bw,i)  =oo_.PointForecast.Mean.E_t(i);
forcast_y_obs(bw,i)  =oo_.PointForecast.Mean.data_y(i);
forcast_pic_obs(bw,i)=oo_.PointForecast.Mean.data_pic(i);

% forcast_y_obs(bw,i)=oo_.PointForecast.Mean.data_y(i);
% forcast_pii_obs(bw,i)=oo_.PointForecast.Mean.data_pid(i);
% forcast_r_obs(bw,i)=oo_.PointForecast.Mean.data_R(i);

fems_pi(bw,i) =datafull(ew+i,1)-forcast_pi_obs(bw,i);
save('fems_pi','fems_pi','-ascii','-double');

fems_wp(bw,i) =datafull(ew+i,2)-forcast_wp_obs(bw,i);
save('fems_wp','fems_wp','-ascii','-double');

fems_c(bw,i)  =datafull(ew+i,3)-forcast_c_obs(bw,i);
save('fems_c','fems_c','-ascii','-double');

fems_i(bw,i)  =datafull(ew+i,4)-forcast_i_obs(bw,i);
save('fems_i','fems_i','-ascii','-double');

fems_R(bw,i)  =datafull(ew+i,5)-forcast_r_obs(bw,i);
save('fems_R','fems_R','-ascii','-double');

fems_E(bw,i)  =datafull(ew+i,6)-forcast_E_obs(bw,i);
save('fems_E','fems_E','-ascii','-double');

fems_y(bw,i)  =datafull(ew+i,7)-forcast_y_obs(bw,i);
save('fems_y','fems_y','-ascii','-double');

fems_pic(bw,i)=datafull(ew+i,8)-forcast_pic_obs(bw,i);
save('fems_pic','fems_pic','-ascii','-double');

% fems_y(bw,i)=datafull(ew+i,8)-forcast_y_obs(bw,i)';
% fems_pi(bw,i)=datafull(ew+i,1)-forcast_pii_obs(bw,i)';
% fems_R(bw,i)=datafull(ew+i,6)-forcast_r_obs(bw,i)';
end
bw=bw+1;
ew=ew+1;

end

for i=1:4
    squared_femspi_obs=fems_pi(:,i).^2;
    squared_femswp_obs=fems_wp(:,i).^2;
    squared_femsc_obs=fems_c(:,i).^2;
    squared_femsi_obs=fems_i(:,i).^2;
    squared_femsr_obs=fems_R(:,i).^2;
    squared_femsE_obs=fems_E(:,i).^2;
    squared_femsy_obs=fems_y(:,i).^2;
    squared_femspic_obs=fems_pic(:,i).^2;
    
%     squared_femsy_obs=fems_y(:,i).^2;
%     squared_femspi_obs=fems_pi(:,i).^2;
%     squared_femsr_obs=fems_R(:,i).^2;
    MSEpi_obs(1,i)=mean(squared_femspi_obs);
    MSEwp_obs(1,i)=mean(squared_femswp_obs);
    MSEc_obs(1,i)=mean(squared_femsc_obs);
    MSEi_obs(1,i)=mean(squared_femsi_obs);
    MSEr_obs(1,i)=mean(squared_femsr_obs);
    MSEe_obs(1,i)=mean(squared_femsE_obs);
    MSEy_obs(1,i)=mean(squared_femsy_obs);
    MSEpic_obs(1,i)=mean(squared_femspic_obs);
    
end
RMSEpi_obs=MSEpi_obs.^0.5
RMSEwp_obs=MSEwp_obs(1,i).^0.5
RMSEc_obs=MSEc_obs.^0.5
RMSEi_obs=MSEi_obs.^0.5
RMSEr_obs= MSEr_obs.^0.5
RMSEe_obs=MSEe_obs.^0.5
RMSEy_obs=MSEy_obs.^0.5
RMSEpic_obs= MSEpic_obs.^0.5

