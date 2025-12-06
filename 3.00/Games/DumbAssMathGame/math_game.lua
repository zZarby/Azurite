
function eval(expression)
    expression = expression:gsub("x", "*")
    

    local function calculate(expr)
        local numberStack = {}
        local operatorStack = {}


        local function applyOperator(op)
            local b = table.remove(numberStack)
            local a = table.remove(numberStack)

            if op == "+" then
                table.insert(numberStack, a + b)
            elseif op == "-" then
                table.insert(numberStack, a - b)
            elseif op == "*" then
                table.insert(numberStack, a * b)
            elseif op == "/" then
                table.insert(numberStack, a / b)
            end
        end

        local i = 1
        while i <= #expr do
            local char = expr:sub(i, i)

            if char:match("%d") then 
                local number = tonumber(char)
                while expr:sub(i + 1, i + 1):match("%d") do
                    i = i + 1
                    number = tonumber(number .. expr:sub(i, i))
                end
                table.insert(numberStack, number)

            elseif char == "+" or char == "-" or char == "*" or char == "/" then
                while #operatorStack > 0 and
                      (char == "+" or char == "-" or
                       (char == "*" or char == "/")) and
                      (operatorStack[#operatorStack] == "*" or operatorStack[#operatorStack] == "/") do
                    local op = table.remove(operatorStack)
                    applyOperator(op)
                end
                table.insert(operatorStack, char)

            elseif char == "(" then  
                table.insert(operatorStack, "(")

            elseif char == ")" then 
                while operatorStack[#operatorStack] ~= "(" do
                    local op = table.remove(operatorStack)
                    applyOperator(op)
                end
                table.remove(operatorStack)
            end

            i = i + 1
        end

        while #operatorStack > 0 do
            local op = table.remove(operatorStack)
            applyOperator(op)
        end

        return numberStack[#numberStack] 
    end

    if not expression:match("^[%d%.%+%-*/%()%s]+$") then
        return false  -- Expression invalide
    end

    return calculate(expression)
end


local SurfaceGui = game:GetService('Workspace').Map.Functional.Screen.SurfaceGui
local QuestionText = nil

for _, v in next, SurfaceGui:GetDescendants() do
    if v.Name == 'QuestionText' and v:IsA('TextLabel') then
        QuestionText = v
    end
end

task.spawn(function()
    while task.wait() do
        if QuestionText and QuestionText.Text then
            local expression = QuestionText.Text:match("^(.-)%s*=")
            if expression then
                local result = eval(expression)
                if result then
                    QuestionText.Text = tostring(result)
                    task.wait(.5)
                    game.Players.LocalPlayer.PlayerGui.MainGui.GameFrame.PCTextBoxContainer.TextBox.Text = tostring(result)
                    task.wait(.5)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,Enum.KeyCode.Return,false,game) 
                end
            end
        end
    end
end)


