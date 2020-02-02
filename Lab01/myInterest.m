function Saving = myInterest(e, F)
F = F * (1 + e);
F = F * 0.97;
F = (1 + e) * F;
F = F + 2500;
F = F * (1 + e);
F = F * 0.92;
F = F * (1 + e);
F = F + 5000;
F = F * (1 + e);
Saving = F;
end


