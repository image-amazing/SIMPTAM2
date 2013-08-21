
ntests = 25;
load WorldFrames;
Frames = World.KeyFrames;

%% Single Constraints



Errors = zeros(18,ntests);

for i = 1:18
    
    for j = 1:ntests
        counts = ones(18,1)*0;
        counts(i) = 1;
        C = constraintmatrix(Frames, World,counts);
        save Constraints C;
        [PTAM World] = proj;
        close all;
        [error count] = calculateworlderror(World.Map,PTAM.Map);
        Errors(i,j) = error;
        save Errors1 Errors

    end
end

clc;
display('Done!');