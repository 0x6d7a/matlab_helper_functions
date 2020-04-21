function terminateExecution
%terminateExecution  Emulates CTRL-C
%    terminateExecution   Stops operation of a program by emulating a
%    CTRL-C press by the user.
%
%    Running this function
%
%Example:
%for ix = 1:100
%    disp(ix)
%    if ix>20
%        terminateExecution;
%    end
%end

%1) request focus be transferred to the command window
%   (H/T http://undocumentedmatlab.com/blog/changing-matlab-command-window-colors/)
cmdWindow = com.mathworks.mde.cmdwin.CmdWin.getInstance();
cmdWindow.grabFocus();

%2) Wait for focus transfer to complete (up to 2 seconds)
focustransferTimer = tic;
while ~cmdWindow.isFocusOwner
    pause(0.1);  %Pause some small interval
    if (toc(focustransferTimer) > 2)
        error('Error transferring focus for CTRL+C press.')
    end
end

%3) Use Java robot to execute a CTRL+C in the (now focused) command window.

%3.1)  Setup a timer to relase CTRL + C in 1 second
%  Try to reuse an existing timer if possible (this would be a holdover
%  from a previous execution)
t_all = timerfindall;
releaseTimer = [];
ix_timer = 1;
while isempty(releaseTimer) && (ix_timer<= length(t_all))
    if isequal(t_all(ix_timer).TimerFcn, @releaseCtrl_C)
        releaseTimer = t_all(ix_timer);
    end
    ix_timer = ix_timer+1;
end
if isempty(releaseTimer)
    releaseTimer = timer;
    releaseTimer.TimerFcn = @releaseCtrl_C;
end
releaseTimer.StartDelay = 1;
start(releaseTimer);

%3.2)  Press press CTRL+C
pressCtrl_C

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pressCtrl_C
    import java.awt.Robot;
    import java.awt.event.*;
    SimKey=Robot;
    SimKey.keyPress(KeyEvent.VK_CONTROL);
    SimKey.keyPress(KeyEvent.VK_C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function releaseCtrl_C(ignore1, ignore2)
    import java.awt.Robot;
    import java.awt.event.*;
    SimKey=Robot;
    SimKey.keyRelease(KeyEvent.VK_CONTROL);
    SimKey.keyRelease(KeyEvent.VK_C);