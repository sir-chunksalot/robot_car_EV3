import VirtualKeycode.*

brick.beep();
%brick.MoveMotor('A', 100);
global key;
InitKeyboard();

LMotor = 'A';
RMotor = 'D';

dir = 1;

while 1
    pause(0.1);

    if (key == 'w')
        brick.StopAllMotors('Brake');
        pause(0.1);
        brick.MoveMotor(LMotor, 100);
        brick.MoveMotor(RMotor, 100);
        disp('W Pressed');
    end
    if (key == 's')
        brick.StopAllMotors('Brake');
        pause(0.1);
        brick.MoveMotor(LMotor, -100);
        brick.MoveMotor(RMotor, -100);
        disp('S Pressed');
    end
    if (key == 'a')
        brick.StopAllMotors('Brake');
        pause(0.1);
        brick.MoveMotor(LMotor, -100);
        brick.MoveMotor(RMotor, 100);
        disp('a Pressed');
    end
    if (key == 'd')
        brick.StopAllMotors('Brake');
        pause(0.1);
        brick.MoveMotor(LMotor, 100);
        brick.MoveMotor(RMotor, -100);
        disp('d Pressed');
    end
    if (key == 'e')
        brick.StopAllMotors('Brake');
        disp('End');
        break;
    end
    if (key == 'q')
        brick.StopAllMotors('Brake');
    end
end


CloseKeyboard();