function y = teste(clock)

test = zeros(1,50);
for i = 2:50
    test(i) = test(i-1) + 1;
end

y = zeros(1,size(clock,1));
for i = 1:size(clock,1)
    if i < size(test,2)
        y(i) = test(floor((clock(i)+0.001)*1000));
    else
        y(i) = test(end);
    end
end

end