
brick.beep();
while 2

    touch = brick.TouchPressed(2); % Read a touch sensor connected to port 2.
    brick.beep();
    if touch
        
        break;            % End program

    end

end