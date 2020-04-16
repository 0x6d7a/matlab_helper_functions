function plotRDMap(rngdop, rng, vel, lim)
    
    s = size(rngdop);
    
    plotResponde = surf(NaN(s(1), s(2)), 'EdgeColor','none');
    colormap(jet(256));colorbar;axis tight;
    set(plotResponde, 'XData', vel, 'YData', rng(1:s(1)));
    axis([vel(1) vel(s(2)) rng(1) rng(s(1))])
    view(2);
    clim = caxis;
    caxis(lim);
    title('Range Doppler Map');
    
    set(plotResponde, 'ZData', rngdop);

end