% max 2x1+5x2
% x1+4x2<=24
% 3x1+x2<=21
% x1+x2<=9
a = [1 4 1 0 0;3 1 0 1 0;1 1 0 0 1];
b = [24;21;9];
A = [a b];
cost=[2 5 0 0 0 0];
bv = [3 4 5];% 3 4 5 represent position of initial basic variables
[m,n]=size(A);
zjcj = cost(bv)*A-cost;
zcj = [zjcj;A];
simptable = array2table(zcj);
simptable.Properties.VariableNames(1:n)={'x_1','x_2','s_1','s_2','s_3','sol'};
disp(simptable);
flag = true;
while flag
    if any(zjcj<0);
        fprintf('the currnt BFS is not optimal\n');
        zc = zjcj(1:end-1);
        [enter_val,pvt_col]=min(zc);
        if all(A(:,pvt_col)<=0)
        error('LPP is unbounded all entries are <=0 in column %d',pvt_col);
    else
        sol = A(:,end);
        column = A(:,pvt_col);
        for i= 1:m
            if column(i)>0
                ratio(i)=sol(i)./column(i);
            else
                ratio(i) = inf;
            end
        end
        [leaving_val,pvt_row] = min(ratio);
        end
        bv(pvt_row) = pvt_col;
        pvt_key = A(pvt_row,pvt_col);
        A(pvt_row,:) = A(pvt_row,:)./pvt_key;
        for i = 1:m
            if i ~= pvt_row
                A(i,:) = A(i,:) - A(i,pvt_col).*A(pvt_row,:);
            end
        end
        zjcj = zjcj-zjcj(pvt_col).*A(pvt_row,:);
        zcj = [zjcj;A];
        disp(array2table(zcj,'VariableNames',{'x_1','x_2','s_1','s_2','s_3','sol'}));
    else
        flag=false;
        fprintf('The current BFS is optimal\n');
    end
end