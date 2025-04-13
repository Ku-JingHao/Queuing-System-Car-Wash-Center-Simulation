% Function to get valid choice from user with validation
function choice = getValidChoice(prompt, maxChoice)
    while true
        choice = input(prompt);
        if choice >= 1 && choice <= maxChoice
            break;
        else
            disp('Invalid input! Try again.');
        end
    end
end