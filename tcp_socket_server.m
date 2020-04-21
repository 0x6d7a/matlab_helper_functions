clear;
close all
clc;

h = java.net.InetAddress.getLocalHost();
fprintf('\nIP Address: %s \n',char(h.getHostAddress()));

t = tcpip('0.0.0.0', 7800, 'NetworkRole', 'server');
t.InputBufferSize = 480000;

flushinput(t);
fopen(t);

while t.BytesAvailable == 0
    pause(1)
end

msg = fread(t, t.BytesAvailable, 'uint8');
fprintf('%s\n', char(msg'));