function [map]=align_surf_to_fsa4(a,hem)

if(hem=='L')
    fsa4L=gifti('/scr/namibia1/Projects/Personality/HCP_Data/fsa4L.gii');        
    Dist = pdist2(a.vertices,fsa4L.vertices);
    for i=1:32492
          mind=min(Dist(i,:));
          map(1,i)=find(Dist(i,:)==mind);
%           Dist(map(i),:)=100000000;
    end;
    
    c.vertices=a.vertices(map,:);
    c.mat=fsa4L.mat;
    c.faces=fsa4L.faces;
elseif(hem=='R')
    fsa4R=gifti('/scr/namibia1/Projects/Personality/HCP_Data/fsa4R.gii');        
    Dist = pdist2(a.vertices,fsa4R.vertices);
    for i=1:32492
              mind=min(Dist(i,:));
          map(1,i)=find(Dist(i,:)==mind);
%           Dist(map(1,i),:)=100000000;
    end;
    c.vertices=a.vertices(map,:);
    c.mat=fsa4R.mat;
    c.faces=fsa4R.faces;
else
    error('CORRECT THE HEMISPHERE')
end;
