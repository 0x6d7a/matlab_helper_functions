function ind = CFAR2Ddetection(rsp, NTCells, NGCells, PD)
    [row, col] = size(rsp);
    inds_c = [];
    for i=1:col
        xxx = rsp(:,i);
        [c, ~] = cfar_detection(xxx, NTCells, NGCells, PD);
        if(~isempty(c))
           for r = 1:length(c)
               inds_c = [inds_c ij2ind(rsp, c(r), i)];
           end
        end
    end

    % Perform CFAR along rng
    inds_r = [];
    for i=1:row
        xxx = rsp(i,:);
        [c, ~] = cfar_detection(xxx, NTCells, NGCells, PD);
        if(~isempty(c))
           for r = 1:length(c)
               inds_r = [inds_r ij2ind(rsp, i, c(r))];
           end
        end
    end

    ind = intersect(inds_r, inds_c);
end