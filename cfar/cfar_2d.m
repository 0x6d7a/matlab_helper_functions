function [f_resp, idx] = cfar_2d(rsp, NTCells, NGCells, PFA)
  [row, col] = size(rsp);
  
  ngard = NGCells;
  nside = NGCells + NTCells;
  ntrain = (nside * 2 + 1)^2 - (ngard * 2 + 1)^2;
  f_resp = zeros(row, col);
  
  alpha = power(PFA, -1 / ntrain) - 1;
%   idx = [];
  
  for i = 1:row
    for j = 1:col
      train_block = rsp(max(i - nside, 1) : min(i + nside, row), max(j - nside, 1) : min(j + nside, col));
      guard_block = rsp(max(i - ngard, 1) : min(i + ngard, row), max(j - ngard, 1) : min(j + ngard, col));

      p_noise = sum(train_block(:)) - sum(guard_block(:));
      thr = p_noise * alpha;
      if(rsp(i,j) > thr)
%         idx = [idx ij2ind(rsp, i, j)];
        f_resp(i,j) = 1;
      end
    end
  end
  
  f_resp = medfilt2(f_resp);
  idx = find(f_resp(:)==1);
end
