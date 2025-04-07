clear all; close all;
% This program demonstrates the dependency of RCS on wavelength 
% The radar line of sight is aligned with the two scatterers
% A plot of RCS variation versus frequency if produced
eps = 0.0001;
scat_spacing = 0.25;
freql = 8e9;
frequ = 12.5e9;
freq = linspace(freql,frequ,500);
wavelength = 3.0e+8 ./ freq;
% Compute electrical scatterer spacing vector in wavelength units
elec_spacing = 2.0 * scat_spacing ./ wavelength;
% Compute RCS (RCS = RCS_scat1 + RCS_scat2) 
rcs = abs ( 1 + cos((2.0 * pi) .* elec_spacing) ... 
 + i * sin((2.0 * pi) .* elec_spacing));
rcs = rcs + eps;
rcs = 20.0*log10(rcs); % RCS ins dBsm
% Plot RCS versus frequency
figure (1);
plot(freq./1e9,rcs);
grid;
xlabel('Frequency in GHz');
ylabel('RCS in dBsm');
% title(' X=Band; scatterer spacing is 0.25 m'); % 
% title(' X=Band; scatterer spacing is 0.75 m'); % 