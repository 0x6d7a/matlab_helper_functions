function subplots(varargin)
  for i = 1:nargin
    subplot(nargin, 1,i);
    plot(varargin{i});
  end
end