function rent = rentPrediction(time)
A = [500 500 600 550 650 650 650 700 800 800 850 850];
B = [1000 1000 1000 1000 1000 200 200 200 200 200 200 200];
planA = A.*time;
planB = B.*time;
if(sum(planA) > sum(planB))
    rent = sum(planA);
else
    rent = sum(planB);
end

