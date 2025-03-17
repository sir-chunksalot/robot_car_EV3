boxfig=figure;
drawnow
akey='a';
set(boxfig,'KeyPressFcn',{@Key_Down,akey},'KeyReleaseFcn',{@Key_Up,akey});
lrshift=0;
kk=1;
down1=0; up1=1;
while kk<2
    drawnow
    if downl==1 && upl==1
        lrshift=1;
        downl=0;
    end    
    fprintf([num2str(lrshift) '\n']);
    lrshift=0;
end %kk

function Key_Down(~,event,leftkey)
if strcmp(event.Key,leftkey),  assignin('base','downl',1);  end
end

function Key_Up(~,event,leftkey)
if strcmp(event.Key,leftkey),  assignin('base','upl',1);  end
end