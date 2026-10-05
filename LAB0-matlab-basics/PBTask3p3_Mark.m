mark = randi(100,1)
%mark = 101
if mark > 100 
    disp('Invalid')
elseif mark >= 80
    disp('High Distinction')
elseif mark >= 70
    disp('Distinction')
elseif mark >= 60
    disp('Credit')
elseif mark >= 50
    disp('Pass')
elseif mark >= 0
    disp('Fail')
else
    disp('Invalid')
end