function y = aprox(x)

if abs(x) < 0.0001
    y = 0;
elseif x > 0.9999
    y = 1;
elseif x < -0.9999
    y = -1;
else
    y = x;
end

end