function create(tabin,depth)

[r,c]=size(tabin);
if r == 1
    return
end
tt = tabin(1,c);
for rr = 1:r-1
    if tabin(rr,c) ~= tt
        break
    end
    if rr == r-1
        fprintf('\t output:%d\n', tt);
        return
    end
end

    function p = p(i,j,k)
        %cnt_t = 0;
        cnt = 0;
        for x = 1:r-1
            if tabin(x,c) == k
                %cnt_t = cnt_t+1;
                if tabin(x,i) == j
                    cnt = cnt+1;
                end
            end
        end
        p = cnt/(r-1);
    end

    function e = En(i,j)
        e = 0;
        for k = 0:1
            if p(i,j,0) ~= 0
                e = e-p(i,j,0)*log2(p(i,j,0));
            end
        end
        %e = -p(i,j,0)*log2(p(i,j,0)) - p(i,j,1)*log2(p(i,j,1));
    end

    function w = W(i,j)
        cnt = 0;
        for x = 1:r-1
            if tabin(x,i) == j
                cnt = cnt+1;
            end
        end
        w = cnt/(r-1);
    end


%E = [];
minimum = 10000;
index = 0;
for i = 1:c-1
    e = En(i,0) * W(i,0) + En(i,1) * W(i,1) + En(i,2) * W(i,2);
    if e < minimum
        minimum = e;
        index = i;
    end
    %E = [E,e];
end

%fprintf("depth is %d\n", depth)
%fprintf("node is x%d\n", index)

for i = 0:2
    table_next = [];
    sameOut = 1;
    temp_o = tabin(1,c);
    for j = 1:r-1
        if tabin(j,index) == i
            table_next = [table_next; tabin(j,:)];
            if temp_o ~= tabin(j,c)
                sameOut = 0;
            end
        end
    end
    table_next = [table_next; tabin(r,:)];
    fprintf("depth is %d\n", depth)
    fprintf("node is x%d\n", index)
    if sameOut == 1
        [rrr,ccc]=size(table_next);
        if rrr ~= 1
            fprintf('when value is: %d\n', i);
            fprintf('\t output:%d\n', temp_o);
        end
    else
        fprintf('when value is: %d\n', i);
        create(table_next,depth+1);
    end
end

end