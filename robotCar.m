brick.beep()
%brick.MoveMotor('A', 100);
global key;
InitKeyboard();

while 1

    pause(0.1);
    
    switch key

    case 'uparrow'

        disp('Up Arrow Pressed!');
        brick.MoveMotor('A', 100);

    case 'downarrow'

        disp('Down Arrow Pressed!');

    case 'leftarrow'

        disp('Left Arrow Pressed!');
        brick.MoveMotor('A', 100);
        brick.StopMotor('D', 'Brake');

    case 'rightarrow'

        disp('Right Arrow Pressed!');
        brick.MoveMotor('D', 100);
        brick.StopMotor('A', 'Brake');

    case 0

        disp('No Key Pressed!');
        brick.StopAllMotors('Brake');

    case 'q'
        brick.StopAllMotors('Brake');
        break;

    end

end

CloseKeyboard();