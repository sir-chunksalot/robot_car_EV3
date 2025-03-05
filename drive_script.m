brick.beep()
%brick.MoveMotor('A', 100);
global key;
InitKeyboard();
mouseL = getAsyncKeyState(VirtualKeyCode.VK_LBUTTON);
LMotor = 'A';
RMotor = 'D';

LMove = 0;
RMove = 0;

while 1
    pause(0.1);

    LMove = 0;
    RMove = 0;
    if (key == 'w')
        LMove = LMove + 100;
        disp('W Pressed');
    end
    if (key == 's')
        LMove = LMove - 100;
        disp('S Pressed');
    end
    if (key == 'i')
        RMove = RMove + 100;
        disp('I Pressed');
    end
    if (key == 'k')
        RMove = RMove - 100;
        disp('K Pressed');
    end
    if (key == 'q')
        brick.StopAllMotors('Brake');
        disp('End');
        break;
    end
    if (mouse)

    brick.MoveMotor(LMotor, LMove);
    brick.MoveMotor(RMotor, RMove);
end


CloseKeyboard();