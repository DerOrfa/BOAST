function fmpoptbs = tbx_cfg_fmpoptbs

% =========================================================================
% MATLABBATCH Configuration file for toolbox 'tbx_cfg_FmpOptBS'
%_______________________________________________________________________
% Copyright (C) 2015-2018 Steffen Volz
% Wellcome Trust Centre for Neuroimaging, London
% and Max Planck Institute for Human Cognitive and Brain Sciences, Leipzig 

% $Id: tbx_cfg_FmpOptBS.m 89 2015-12-16 11:03:00Z steffen $
% =========================================================================

% Updated 23/09/2024
% by Shokoufeh Golshani


if ~isdeployed
    addpath(fullfile(spm('Dir'),'toolbox','FmpOptBS')); 
end

%==========================================================================
% Default values that are common to all FmpOptBS jobs
%==========================================================================

% -------------------------------------------------------------------------
% field maps
% -------------------------------------------------------------------------
fieldmaps         = cfg_files;
fieldmaps.tag     = 'fieldmaps';
fieldmaps.name    = 'Input fieldmaps';
fieldmaps.help    = {['One fieldmap or 3 fieldmap gradient (dX dY dZ) files ' ...
                      'for optimizing BOLD sensitivity.']};
fieldmaps.ufilter = '.*';
fieldmaps.num     = [1 Inf];

% -------------------------------------------------------------------------
% template
% -------------------------------------------------------------------------
template         = cfg_files;
template.tag     = 'template';
template.name    = 'Input template';
template.help    = {'Brain mask template for illustration (only placeholder at the moment)'};
template.ufilter = '.*';
template.num     = [1 Inf];

% -------------------------------------------------------------------------
% ROIs
% -------------------------------------------------------------------------
rois         = cfg_files;
rois.tag     = 'rois';
rois.name    = 'Input ROIs';
rois.help    = {'ROIs for which BOLD is optimized.'};
rois.ufilter = '.*';
rois.num     = [1 Inf];

% -------------------------------------------------------------------------
% Input Files
% -------------------------------------------------------------------------
inputfiles         = cfg_branch;
inputfiles.tag     = 'inputfiles';
inputfiles.name    = 'Input Files';
inputfiles.val     = {fieldmaps template rois};
inputfiles.help    = {'Needed Input Files'};


% =========================================================================
% Set Default EPI Parameters
% =========================================================================
EPI_param = SetDefaultEPIParam;

% -------------------------------------------------------------------------
% Main Orientation
% -------------------------------------------------------------------------
main_orientation         = cfg_menu;
main_orientation.tag     = 'main_orientation';
main_orientation.name    = 'Choose the main orientation';
main_orientation.help    = {'Option to choose the main orientation'};
main_orientation.labels  = {'TRA' 'COR' 'SAG'};
main_orientation.values  = {'TRA' 'COR' 'SAG'};
main_orientation.val     = {EPI_param.main_orientation};

% -------------------------------------------------------------------------
% Field of View
% -------------------------------------------------------------------------
fov         = cfg_entry;
fov.tag     = 'fov';
fov.name    = 'field of view';
fov.val     = {EPI_param.fov};
fov.help    = {'Field of View in mm'};
fov.strtype = 'r';
fov.num     = [1 1];

% -------------------------------------------------------------------------
% Base Resolution
% -------------------------------------------------------------------------
base_res         = cfg_entry;
base_res.tag     = 'base_res';
base_res.name    = 'Base Resolution';
base_res.val     = {EPI_param.base_res};
base_res.help    = {'Base Resolution in #px'};
base_res.strtype = 'r';
base_res.num     = [1 1];

% -------------------------------------------------------------------------
% Phase Encoding Steps
% -------------------------------------------------------------------------
pe_neff         = cfg_entry;
pe_neff.tag     = 'pe_neff';
pe_neff.name    = 'Phase Encoding Steps';
pe_neff.val     = {EPI_param.pe_neff};
pe_neff.help    = {'Phase Encoding Steps in #px'};
pe_neff.strtype = 'r';
pe_neff.num     = [1 1];

% -------------------------------------------------------------------------
% Slice Thickness
% -------------------------------------------------------------------------
slicethickness         = cfg_entry;
slicethickness.tag     = 'slicethickness';
slicethickness.name    = 'Slice Thickness';
slicethickness.val     = {EPI_param.delta_z};
slicethickness.help    = {['Slice Thickness or (if known) the Full Width at ' ...
                           'Half Maximum (FWHM) of the slice excitation profile in mm']};
slicethickness.strtype = 'r';
slicethickness.num     = [1 1];

% -------------------------------------------------------------------------
% Echo Spacing
% -------------------------------------------------------------------------
echospacing         = cfg_entry;
echospacing.tag     = 'echospacing';
echospacing.name    = 'Echo Spacing';
echospacing.val     = {EPI_param.echo_spacing};
echospacing.help    = {'Echo Spacing in ms'};
echospacing.strtype = 'r';
echospacing.num     = [1 1];

% -------------------------------------------------------------------------
% Echo Time
% -------------------------------------------------------------------------
echotime         = cfg_entry;
echotime.tag     = 'echotime';
echotime.name    = 'Echo Time';
echotime.val     = {EPI_param.echotime};
echotime.help    = {'Echo Time in ms'};
echotime.strtype = 'r';
echotime.num     = [1 1];

% -------------------------------------------------------------------------
% Voxel size
% -------------------------------------------------------------------------
vox         = cfg_entry;
vox.tag     = 'vox';
vox.name    = 'Voxel size';
vox.val     = {EPI_param.vox};
vox.help    = {'Voxel Size [phase, read, slice] in mm'};
vox.strtype = 'r';
vox.num     = [1 3];

% -------------------------------------------------------------------------
% Fixed Protocol Parameters
% -------------------------------------------------------------------------
fixedparameters         = cfg_branch;
fixedparameters.tag     = 'fixedparameters';
fixedparameters.name    = 'Fixed Protocol Parameters';
fixedparameters.val     = {main_orientation fov base_res pe_neff slicethickness echospacing echotime vox};
fixedparameters.help    = {'Fixed Protocol Parameters'};


% =========================================================================
% Set Simulation Parameters
% =========================================================================
SimuParam = SetDefaultSimulationParam;

% -------------------------------------------------------------------------
% Parameter shimz
% -------------------------------------------------------------------------
shimz         = cfg_entry;
shimz.tag     = 'shimz';
shimz.name    = 'shimz';
shimz.val     = {SimuParam.shimz};
shimz.help    = {'Shim Gradient in z-direction [min ref max step-size] in mT/m'};
shimz.strtype = 'r';
shimz.num     = [1 4];

% -------------------------------------------------------------------------
% Parameter tau
% -------------------------------------------------------------------------
tau         = cfg_entry;
tau.tag     = 'tau';
tau.name    = 'tau';
tau.val     = {SimuParam.tau};
tau.help    = {'Duration of Compensation Gradients in x,y,z directions in ms'};
tau.strtype = 'r';
tau.num     = [1 3];

% -------------------------------------------------------------------------
% Parameter tilt
% -------------------------------------------------------------------------
tilt         = cfg_entry;
tilt.tag     = 'tilt';
tilt.name    = 'tilt';
tilt.val     = {SimuParam.tilt};
tilt.help    = {'Slice Tilt in degree [min ref max step-size]'};
tilt.strtype = 'r';
tilt.num     = [1 4];

% -------------------------------------------------------------------------
% Reduce Field size
% -------------------------------------------------------------------------
rfs         = cfg_entry;
rfs.tag     = 'rfs';
rfs.name    = 'Reduce Field size';
rfs.val     = {SimuParam.rfs};
rfs.help    = {'0 = no (original size), 1 = yes (1/3)'};
rfs.strtype = 'r';
rfs.num     = [1 1];

% -------------------------------------------------------------------------
% Simulation Parameters
% -------------------------------------------------------------------------
simu         = cfg_branch;
simu.tag     = 'simu';
simu.name    = 'Simulation Parameters';
simu.val     = {shimz tau tilt rfs};
simu.help    = {'Parameters used for the simulations'};


% =========================================================================
% Preprocessing
% =========================================================================
% -------------------------------------------------------------------------
% BOLD Sensitivity Optimisation
% -------------------------------------------------------------------------
fmpoptbs         = cfg_exbranch;
fmpoptbs.tag     = 'FmpOptBS';
fmpoptbs.name    = 'BS Optimisation';
fmpoptbs.val     = {inputfiles fixedparameters simu};
fmpoptbs.help    = {'This toolbox is currently only work in progress.'};
fmpoptbs.prog = @fmpoptbs_apply;
fmpoptbs.vout = @vout_fmpoptbs_apply;
% -------------------------------------------------------------------------


% =========================================================================
function out = fmpoptbs_apply(job)

out.results = epi_opt_param_TB(job.inputfiles.fieldmaps, ...
                               job.inputfiles.rois, ...
                               job.inputfiles.template, ...
                               job.fixedparameters.main_orientation, ...
                               job.fixedparameters.fov, ...
                               job.fixedparameters.base_res, ...
                               job.fixedparameters.pe_neff, ...
                               job.fixedparameters.slicethickness, ...
                               job.fixedparameters.echospacing, ...
                               job.fixedparameters.echotime, ...
                               job.fixedparameters.vox, ...
                               job.simu.tilt, ...
                               job.simu.shimz, ...
                               job.simu.tau, ...
                               job.simu.rfs);


out.fmfiles = job.inputfiles.fieldmaps;


% =========================================================================
function dep = vout_fmpoptbs_apply(job)
% do something
dep = cfg_dep;
