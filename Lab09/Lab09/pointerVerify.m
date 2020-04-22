function result = pointerVerify(sid1)
    sid2 = sid1;
    sid2.name = "Jacbo";
    if (strcmp(sid1.name, sid2.name))
        result = 1;
    else
        result = 2;
    end
end 