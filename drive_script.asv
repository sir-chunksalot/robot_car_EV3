brick.beep();
disp(brick.GetBattLevel());
%brick.MoveMotor('A', 100);
global key;
InitKeyboard();
LMotor = 'A';
RMotor = 'D';
clawMotor = 'B';
colorSensor = 2;
distanceSensor = 4;
killSwitch = 1;
wallButton = 3;
speed = 55;
pauseDelay = .5;
leftTurnAngle = .64;
rightTurnAngle = .95;

auto = false;
while 1
    pause(0.1);

    if(auto == false) 
        
        pause(0.1);
      
        if (key == 'w')
            forward(brick, LMotor, RMotor, speed, pauseDelay);
            disp('W Pressed');
        end
        if (key == 's')
            reverse(brick, LMotor, RMotor, speed, pauseDelay);
            disp('S Pressed');
        end
        if (key == 'a')
            turnLeft(brick, LMotor, RMotor, speed, .2);
            disp('a Pressed');
        end
        if (key == 'd')
            turnRight(brick, LMotor, RMotor, speed, .2);
            disp('d Pressed');
        end
        if(key == 'z')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(clawMotor, -speed);
            pause(pauseDelay);
            brick.StopAllMotors('Brake');
            disp('z Pressed');
        end
        if(key == 'x')
            brick.StopAllMotors('Brake');
            pause(0.1);
            brick.MoveMotor(clawMotor, speed);
            pause(pauseDelay);
            brick.StopAllMotors('Brake');
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
        

        brick.MoveMotor(LMotor, speed);
        brick.MoveMotor(RMotor, speed);
        
        %print color of object
        fprintf("\tRed: %d\n", color_rgb(1));
        fprintf("\tGreen: %d\n", color_rgb(2));
        fprintf("\tBlue: %d\n", color_rgb(3));
        disp("auto");

        if(color_rgb(1) > color_rgb(2)  + (color_rgb(3) * 2)) %red 
            %stop for one second
            disp("detected red");
            brick.StopAllMotors('Brake');
            pause(1);
            brick.MoveMotor(LMotor, speed);
            brick.MoveMotor(RMotor, speed);
            pause(.5);

        end
        if(color_rgb(2) > color_rgb(1) + color_rgb(3)) %green
            %pickup
            %brick.StopAllMotors('Brake');
            %auto = ~auto;
            brick.beep();
            pause(.3);
            brick.beep();
            pause(.3);
            brick.beep();
            brick.StopAllMotors('Brake');
            pause(1);
            disp("detected green. switching to manual control");
        end
        if(color_rgb(3) > color_rgb(1) + color_rgb(2)) %blue
            %drop off
            disp("detected blue");
            brick.beep();
            pause(.3);
            brick.beep();
            brick.StopAllMotors('Brake');
            pause(1);
        end


        %dist
        
        
        wallReading = brick.TouchPressed(wallButton);
        %bumped into wall
        if(wallReading == 1)
            
            %checks to see if there is room to the right
            
            disp("BUTTON PRESSED");
            reverse(brick, LMotor, RMotor, speed, .8);
            turnLeft(brick, LMotor, RMotor, speed, leftTurnAngle);
            
            
        end

        distance = brick.UltrasonicDist(distanceSensor);
        disp("distance" + distance);
        if(distance < 8) % if so, turn right
            disp("too close to wall");
            turnLeft(brick, LMotor, RMotor, speed, .2)
        end
        if(distance > 65) % if so, turn right
            forward(brick, LMotor, RMotor, speed, .8);
            turnRight(brick, LMotor, RMotor, speed, rightTurnAngle);
            disp("CLEARING WALL");
            forward(brick, LMotor, RMotor, speed, 2);
        end
        


    end %end auto
       

    if(key == '0')

        disp("0 pressed");
        brick.StopAllMotors('Brake');
        auto = ~auto;
        pause(.5);
    end
    if(key == 'm') 
        disp("end code")
        brick.StopAllMotors('Brake');
        break;
    end
    killReading = brick.TouchPressed(killSwitch);
    if(killReading == 1) 
        disp("end code")
        brick.StopAllMotors('Brake');
        break;
    end
    
end

CloseKeyboard();

function turnLeft(brick, LMotor, RMotor, speed, turnAngle)
    disp("TURNING LEFT");
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, -speed);
    brick.MoveMotor(RMotor, speed);
    pause(turnAngle);
    brick.StopAllMotors('Brake');
end

function turnRight(brick, LMotor, RMotor, speed, turnAngle)
    disp("TURNING RIGHT");
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, speed);
    brick.MoveMotor(RMotor, -speed);
    pause(turnAngle);
    brick.StopAllMotors('Brake');
end

function reverse(brick, LMotor, RMotor, speed, pauseDelay)
    disp("REVERSE");
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, -speed);
    brick.MoveMotor(RMotor, -speed);
    pause(pauseDelay);
    brick.StopAllMotors('Brake');
end
function forward(brick, LMotor, RMotor, speed, pauseDelay)
    disp("FORWARD");
    brick.StopAllMotors('Brake');
    pause(0.1);
    brick.MoveMotor(LMotor, speed);
    brick.MoveMotor(RMotor, speed);
    pause(pauseDelay);
    brick.StopAllMotors('Brake');
end


