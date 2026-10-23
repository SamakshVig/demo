a = [-2 -3 -5 1 0 0;3 1 7 0 1 0;1 4 6 0 0 1];
b = [-2;3;5];
A = [a b];
cost = [-2 -2 -4 0 0 0 0];
bv = [4 5 6];% 4 5 6 represent position of initial basic variables
zjcj = cost(bv)*A-cost;
run = true;
[m,n] = size(A);
while run
    if any(A(:,n)<0)
        fprintf('the current BFS is not feasible\n');
        [lvg_val,pvt_row] = min(A(:,n));
        for i=1:n-1
            if A(pvt_row,i)<0
                f(i) = zjcj(i)/A(pvt_row,i);
            else
                f(i) = -inf;
            end
        end
        [ent_val,pvt_col] = max(f);
        A(pvt_row,:) = A(pvt_row,:)/A(pvt_row,pvt_col);
        for i = 1:m
            if i ~= pvt_row;
                A(i,:) = A(i,:) - A(i,pvt_col).*A(pvt_row,:);
            end
        end
        bv(pvt_row) = pvt_col;
        zjcj = zjcj-zjcj(pvt_col).*A(pvt_row,:);
        zcj = [zjcj;A];
        table = array2table(zcj);
        table.Properties.VariableNames(1:n) = {'x1','x2','x3','s1','s2','s3','sol'}
    else
        run = false;
        fprintf('current BFS is feasible and optimal\n');
    end
end
