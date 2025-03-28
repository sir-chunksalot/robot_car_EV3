brick.beep();
%brick.MoveMotor('A', 100);
global key;
InitKeyboard();
LMotor = 'A';
RMotor = 'D';
clawMotor = 'C';
colorSensor = 2;
distanceSensor = 3;
killSwitch = 1;
speed = -50;

turnCounter = 0;

auto = true;
while 1
    pause(0.1);

    if(auto == false) 
        pause(0.1);
        if (key == 'w')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(LMotor, speed);
            brick.MoveMotor(RMotor, speed);
            disp('W Pressed');
        end
        if (key == 's')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(LMotor, -speed);
            brick.MoveMotor(RMotor, -speed);
            disp('S Pressed');
        end
        if (key == 'a')
            turnLeft(brick, LMotor, RMotor, speed);
            disp('a Pressed');
        end
        if (key == 'd')
            turnRight(brick, LMotor, RMotor, speed);
            disp('d Pressed');
        end
        if(key == 'z')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(clawMotor, -speed);
            disp('z Pressed');
        end
        if(key == 'x')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(clawMotor, speed);
            disp('x Pressed');
        end
        if (key == 'e')
            brick.StopAllMotors('Brake');
            disp('End');
        end
        if (key == 'q')
            brick.StopAllMotors('Brake');

        end
    end
    if(auto)
        brick.SetColorMode(colorSensor, 4); 
        color_rgb = brick.ColorRGB(colorSensor);
        distance = brick.UltrasonicDist(distanceSensor);
        
        %print color of object
        fprintf("\tRed: %d\n", color_rgb(1));
        fprintf("\tGreen: %d\n", color_rgb(2));
        fprintf("\tBlue: %d\n", color_rgb(3));
        disp("auto");

        if(color_rgb(1) > color_rgb(2) + (color_rgb(3) * 2)) %red 
            %stop for one second
            disp("detected red");
            brick.StopAllMotors('Brake');
            pause(1);

        end
        if(color_rgb(2) > color_rgb(1) + color_rgb(3)) %green
            %pickup
            disp("detected green");
        end
        if(color_rgb(3) > color_rgb(1) + color_rgb(2)) %blue
            %drop off
            disp("detected blue");
        end


        %dist
        disp("distance" + distance);
        if(distance < 23)
            if(turnCounter < 3)
                turnLeft(brick, LMotor, RMotor, speed);
                pause(2.55);
                brick.StopAllMotors('Brake');
                turnCounter = turnCounter + 1;
            elseif(turnCounter < 5)
                turnRight(brick, LMotor, RMotor, speed);
                pause(2.55);
                brick.StopAllMotors('Brake');
                turnCounter = turnCounter + 1;
            end
            
            
        end

        brick.MoveMotor(LMotor, speed);
        brick.MoveMotor(RMotor, speed);

    end

    if(key == '0')
        disp("0 pressed");
        brick.StopAllMotors('Brake');
        auto = ~auto;
    end
    if(key == 'm') 
        disp("end code")
        brick.StopAllMotors('Brake');
        break;
    end
    reading = brick.TouchPressed(killSwitch);
    if(reading == 1) 
        disp("end code")
        brick.StopAllMotors('Brake');
        break;
    end
    
end

CloseKeyboard();

function turnLeft(brick, LMotor, RMotor, speed)
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, -speed * 2);
    brick.MoveMotor(RMotor, speed * 2);
end

function turnRight(brick, LMotor, RMotor, speed)
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, speed * 2);
    brick.MoveMotor(RMotor, -speed * 2);
end


