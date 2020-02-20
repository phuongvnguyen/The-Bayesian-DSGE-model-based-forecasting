% function =
% 
% 
% filename = 'Geweke_test.xlsx';
% % 
% names = {'SE_eps_epshat','SE_eps_etamchat','SE_eps_etamihat',...
%     'SE_eps_lambdafhat','SE_eps_upsilonhat','SE_eps_phitildehat','SE_eps_zetachat',' SE_eps_zetahhat',...
%     'SE_eps_zetatildehat','SE_eps_lambdaxhat','SE_eps_epsRhat','SE_eps_piThat',...
%     'xiw','xid','ximc ','ximi ',' xix ','xie ','kappad ','kappaw ','kappamc ','kappami ','kappax ',...
%     'SS ','b ','lambdaf ','lambdamc ','lambdami ','etai ',' etaf ','phitilde ','phitildes ',...
%     ' rhoR ','rpie ','rdeltapi ','rx ','ry ',' rdeltay ','rhomuz ','rhoeps ','rhoiota ',...
%     'rhophitilde ','rhozetac ','rhozetah ','rhozetatilde '}';
 
% %  %xlswrite(filename, exdata, 'data', 'A2');

% %save('wdata.mat','data_current_window'); %save data
% geweke=zeros(45,4)
for i=1:4
geweke(1,i)=oo_.convergence.geweke.SE_eps_epshat.prob_chi2_test(i)
end
for i=1:4
geweke(2,i)=oo_.convergence.geweke.SE_eps_etamchat.prob_chi2_test(i)   
end

for i=1:4
geweke(3,i)=oo_.convergence.geweke.SE_eps_etamihat.prob_chi2_test(i) 
end
for i=1:4
geweke(4,i)=oo_.convergence.geweke.SE_eps_lambdafhat.prob_chi2_test(i) 
end
for i=1:4
geweke(5,i)=oo_.convergence.geweke.SE_eps_upsilonhat.prob_chi2_test(i) 
end
for i=1:4
geweke(6,i)=oo_.convergence.geweke.SE_eps_phitildehat.prob_chi2_test(i) 
end
for i=1:4
geweke(7,i)=oo_.convergence.geweke.SE_eps_zetachat.prob_chi2_test(i) 

end
for i=1:4
geweke(8,i)=oo_.convergence.geweke.SE_eps_zetahhat.prob_chi2_test(i) 
end
for i=1:4
geweke(9,i)=oo_.convergence.geweke.SE_eps_zetatildehat.prob_chi2_test(i) 

end
for i=1:4
geweke(10,i)=oo_.convergence.geweke.SE_eps_lambdaxhat.prob_chi2_test(i) 

end
for i=1:4
geweke(11,i)=oo_.convergence.geweke.SE_eps_epsRhat.prob_chi2_test(i) 

end
for i=1:4
geweke(12,i)=oo_.convergence.geweke.SE_eps_piThat.prob_chi2_test(i) 

end
for i=1:4
geweke(13,i)=oo_.convergence.geweke.xiw.prob_chi2_test(i) 

end
for i=1:4
geweke(14,i)=oo_.convergence.geweke.xid.prob_chi2_test(i) 

end
for i=1:4
geweke(15,i)=oo_.convergence.geweke.ximc.prob_chi2_test(i) 

end
for i=1:4
geweke(16,i)=oo_.convergence.geweke.ximi.prob_chi2_test(i) 

end
for i=1:4
geweke(17,i)=oo_.convergence.geweke.xix.prob_chi2_test(i) 

end
for i=1:4
geweke(18,i)=oo_.convergence.geweke.xie.prob_chi2_test(i) 

end
for i=1:4
geweke(19,i)=oo_.convergence.geweke.kappad.prob_chi2_test(i) 

end
for i=1:4
geweke(20,i)=oo_.convergence.geweke.kappaw.prob_chi2_test(i) 
end
for i=1:4
geweke(21,i)=oo_.convergence.geweke.kappamc.prob_chi2_test(i) 

end
for i=1:4
geweke(22,i)=oo_.convergence.geweke.kappami.prob_chi2_test(i) 

end
for i=1:4
geweke(23,i)=oo_.convergence.geweke.kappax.prob_chi2_test(i) 

end
for i=1:4
geweke(24,i)=oo_.convergence.geweke.SS.prob_chi2_test(i) 

end
for i=1:4
geweke(25,i)=oo_.convergence.geweke.b.prob_chi2_test(i) 

end
for i=1:4
geweke(26,i)=oo_.convergence.geweke.lambdaf.prob_chi2_test(i) 

end
for i=1:4
geweke(27,i)=oo_.convergence.geweke.lambdamc.prob_chi2_test(i) 

end
for i=1:4
geweke(28,i)=oo_.convergence.geweke.lambdami.prob_chi2_test(i) 

end
for i=1:4
geweke(29,i)=oo_.convergence.geweke.etai.prob_chi2_test(i) 

end
for i=1:4
geweke(30,i)=oo_.convergence.geweke.etaf.prob_chi2_test(i) 

end
for i=1:4
geweke(31,i)=oo_.convergence.geweke.phitilde.prob_chi2_test(i) 

end
for i=1:4
geweke(32,i)=oo_.convergence.geweke.phitildes.prob_chi2_test(i) 

end
for i=1:4
geweke(33,i)=oo_.convergence.geweke.rhoR.prob_chi2_test(i) 

end
for i=1:4
geweke(34,i)=oo_.convergence.geweke.rpie.prob_chi2_test(i) 
end
for i=1:4
geweke(35,i)=oo_.convergence.geweke.rdeltapi.prob_chi2_test(i) 
end
for i=1:4
geweke(36,i)=oo_.convergence.geweke.rx.prob_chi2_test(i) 
end
for i=1:4
geweke(37,i)=oo_.convergence.geweke.ry.prob_chi2_test(i) 
end
for i=1:4
geweke(38,i)=oo_.convergence.geweke.rdeltay.prob_chi2_test(i) 
end
for i=1:4
geweke(39,i)=oo_.convergence.geweke.rhomuz.prob_chi2_test(i) 
end
for i=1:4
geweke(40,i)=oo_.convergence.geweke. rhoeps.prob_chi2_test(i) 
end
for i=1:4
geweke(41,i)=oo_.convergence.geweke.rhoiota.prob_chi2_test(i) 
end
for i=1:4
geweke(42,i)=oo_.convergence.geweke.rhophitilde.prob_chi2_test(i) 
end
for i=1:4
geweke(43,i)=oo_.convergence.geweke.rhozetac.prob_chi2_test(i) 
end
for i=1:4
geweke(44,i)=oo_.convergence.geweke.rhozetah.prob_chi2_test(i) 
end

for i=1:4
geweke(45,i)=oo_.convergence.geweke.rhozetatilde.prob_chi2_test(i) 
end
namess={'NWE_taper_0','NWE_taper_4','NWE_taper_8','NWE_taper_15'}
xlswrite(filename, namess, 'Sheet1', 'B1');
xlswrite(filename, names, 'Sheet1', 'A2');
xlswrite(filename,geweke, 'Sheet1', 'B2');

