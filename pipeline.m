hcp_fold='/afs/cbs.mpg.de/documents/connectome/_all';
sub_id=dir(hcp_fold);
sub_id(1:2)=[];
[m,n]=size(sub_id);
addpath('/scr/namibia1/Toolboxes/gifti-1.4');
addpath('/scr/namibia1/Toolboxes/cifti-matlab-master');
addpath('/scr/namibia1/Toolboxes/iso2mesh');
addpath('/scr/namibia1/Toolboxes/nifti');
proind=1;
for i=1:m
    tic
    i
    try
        sub_fs32_fold=[hcp_fold '/' sub_id(i).name '/MNINonLinear/fsaverage_LR32k'];
        fs32_L=gifti([sub_fs32_fold '/' sub_id(i).name '.L.white.32k_fs_LR.surf.gii']);
        fs32_R=gifti([sub_fs32_fold '/' sub_id(i).name '.R.white.32k_fs_LR.surf.gii']);
        [mapl]=align_surf_to_fsa4(fs32_L,'L');
%         fs32_Ld=gifti(cl);
        [mapr]=align_surf_to_fsa4(fs32_R,'R');
%         fs32_Rd=gifti(cr);
%         save(fs32_Ld,['/scr/kaiser2/Manousos/HCP/Anatomy/' sub_id(i).name '_fs5k_L.gii']);
%         save(fs32_Rd,['/scr/kaiser2/Manousos/HCP/Anatomy/' sub_id(i).name '_fs5k_R.gii']);
        save(['/scr/kaiser2/Manousos/HCP/Mapping/' sub_id(i).name '_map_R.mat'],'mapr');
        save(['/scr/kaiser2/Manousos/HCP/Mapping/' sub_id(i).name '_map_L.mat'],'mapl');
        signals=ft_read_cifti([hcp_fold '/' sub_id(i).name '/MNINonLinear/Results/rfMRI_REST1_LR/rfMRI_REST1_LR_Atlas_hp2000_clean.dtseries.nii']);
        signals_l=signals.dtseries(1:32492,:);
        signals_r=signals.dtseries(32492+1:32492+32492,:);
        for i=1:2562
            signals_ld(i,:)=mean(signals_l(mapl==i,:),1);
            signals_rd(i,:)=mean(signals_r(mapr==i,:),1);
        end;
        signals_all=[signals_ld;signals_rd];
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_L1.mat'],'signals_ld');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_R1.mat'],'signals_rd');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_all1.mat'],'signals_all');
        Cl=corrcoef(signals_ld');
        Cr=corrcoef(signals_rd');
        Call=corrcoef(signals_all');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_L1.mat'],'Cl');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_R1.mat'],'Cr');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_all1.mat'],'Call');

        signals=ft_read_cifti([hcp_fold '/' sub_id(i).name '/MNINonLinear/Results/rfMRI_REST1_RL/rfMRI_REST1_RL_Atlas_hp2000_clean.dtseries.nii']);
        signals_l=signals.dtseries(1:32492,:);
        signals_r=signals.dtseries(32492+1:32492+32492,:);
        for i=1:2562
            signals_ld(i,:)=mean(signals_l(mapl==i,:),1);
            signals_rd(i,:)=mean(signals_r(mapr==i,:),1);
        end;
        signals_all=[signals_ld;signals_rd];
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_L2.mat'],'signals_ld');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_R2.mat'],'signals_rd');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_all2.mat'],'signals_all');
        Cl=corrcoef(signals_ld');
        Cr=corrcoef(signals_rd');
        Call=corrcoef(signals_all');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_L2.mat'],'Cl');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_R2.mat'],'Cr');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_all2.mat'],'Call');

        signals=ft_read_cifti([hcp_fold '/' sub_id(i).name '/MNINonLinear/Results/rfMRI_REST2_LR/rfMRI_REST2_LR_Atlas_hp2000_clean.dtseries.nii']);
        signals_l=signals.dtseries(1:32492,:);
        signals_r=signals.dtseries(32492+1:32492+32492,:);
        for i=1:2562
            signals_ld(i,:)=mean(signals_l(mapl==i,:),1);
            signals_rd(i,:)=mean(signals_r(mapr==i,:),1);
        end;
        signals_all=[signals_ld;signals_rd];
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_L3.mat'],'signals_ld');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_R3.mat'],'signals_rd');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_all3.mat'],'signals_all');
        Cl=corrcoef(signals_ld');
        Cr=corrcoef(signals_rd');
        Call=corrcoef(signals_all');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_L3.mat'],'Cl');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_R3.mat'],'Cr');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_all3.mat'],'Call');

        signals=ft_read_cifti([hcp_fold '/' sub_id(i).name '/MNINonLinear/Results/rfMRI_REST2_RL/rfMRI_REST2_RL_Atlas_hp2000_clean.dtseries.nii']);
        signals_l=signals.dtseries(1:32492,:);
        signals_r=signals.dtseries(32492+1:32492+32492,:);
        for i=1:2562
            signals_ld(i,:)=mean(signals_l(mapl==i,:),1);
            signals_rd(i,:)=mean(signals_r(mapr==i,:),1);
        end;
        signals_all=[signals_ld;signals_rd];

        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_L4.mat'],'signals_ld');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_R4.mat'],'signals_rd');
        save(['/scr/kaiser2/Manousos/HCP/Signals/' sub_id(i).name '_all4.mat'],'signals_all');
        Cl=corrcoef(signals_ld');
        Cr=corrcoef(signals_rd');
        Call=corrcoef(signals_all');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_L4.mat'],'Cl');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_R4.mat'],'Cr');
        save(['/scr/kaiser2/Manousos/HCP/Connectivity/' sub_id(i).name '_all4.mat'],'Call');
    catch
        prob_subs(proind)=i;
        proind=proind+1;
    end;
    toc
end;
