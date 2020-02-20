clear all; close all; clc;

datafull = xlsread('Trans_Aus_Dat_dynare.xls','Trans_Aus_Dat','A2:N93');
T =length(datafull(:,1));
bw =1;
ew =60;
hmax=4; % 
nr_window = (T - hmax) - ew + 1;
forcast_y_obs=zeros(nr_window,4);
forcast_pii_obs=zeros(nr_window,4);
forcast_r_obs=zeros(nr_window,4);
fems_y=zeros(nr_window,4); 
fems_pi=zeros(nr_window,4); 
fems_R=zeros(nr_window,4); 


%% for Rolling Window
while  ew <= T - hmax
    
data_current_window=datafull(bw:ew,:); % cut data to required window

filename = 'Data_for_Dynare_rw.xlsx';

names = {'data_pid','data_wp','data_c',...
    'data_i','x_hat','data_R','E_t','data_y',...
    'data_x','data_m','data_pic','data_ystar',...
    'data_pistar','data_Rstar'};
 xlswrite(filename,data_current_window, 'Sheet1', 'A2');
%  %xlswrite(filename, exdata, 'data', 'A2');
 xlswrite(filename, names, 'Sheet1', 'A1');
%save('wdata.mat','data_current_window'); %save data

dynare ALEstim_pet noclearall 

for i=1:hmax
forcast_y_obs(bw,i)=oo_.PointForecast.Mean.data_y(i);
forcast_pii_obs(bw,i)=oo_.PointForecast.Mean.data_pid(i);
forcast_r_obs(bw,i)=oo_.PointForecast.Mean.data_R(i);

fems_y(bw,i)=datafull(ew+i,8)-forcast_y_obs(bw,i)';
fems_pi(bw,i)=datafull(ew+i,1)-forcast_pii_obs(bw,i)';
fems_R(bw,i)=datafull(ew+i,6)-forcast_r_obs(bw,i)';
end
bw=bw+1;
ew=ew+1;

end

for i=1:4
    squared_femsy_obs=fems_y(:,i).^2;
    squared_femspi_obs=fems_pi(:,i).^2;
    squared_femsr_obs=fems_R(:,i).^2;
    MSEy_obs(1,i)=mean(squared_femsy_obs);
    MSEpi_obs(1,i)=mean(squared_femspi_obs);
    MSEr_obs(1,i)=mean(squared_femsr_obs);
end

RMSEy_obs=MSEy_obs.^0.5
RMSEpi_obs=MSEpi_obs.^0.5
RMSEr_obs=MSEr_obs.^0.5

