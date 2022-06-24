function dtree(tabin)

if nargin == 0
    %{
    This is training data.
    Each row contains a set of input values followed by a binary output
    value in the last column.
    The last row contains indices of inputs (attributes) - 0 denotes the output.
    %}
    tabin = [
        1 0 0 0 1 1;
        1 0 0 1 2 1;
        1 0 0 1 1 1;
        1 1 0 0 2 0;
        1 1 0 1 2 1;
        1 1 2 1 1 1;
        2 1 0 0 0 1;
        2 1 1 1 2 1;
        1 2 3 4 5 0];
end

%{
The decision tree is created by subsequently choosing the input (attribute)
with the LOWEST ENTROPY as the current root.

-------------------------------------------------------------------------
For each attribute 'i' and each input value 'j' we have to calculate the
entropy E(i,j):
    E(i,j) = -p(i,j,0)*log2(p(i,j,0)) - p(i,j,1)*log2(p(i,j,1))
where
    p(i,j,k) - the probability that the output value is 'k' when
               attribute 'i' is set to 'j'

The attribute for the current root is chosen by finding the minimum value
of the entropy E(i):
    E(i) = w(i,0)*E(i,0) + w(i,1)*E(i,1) + ...
where
    w(i,j) - the probability that the attribute 'i' is set to 'j'

-------------------------------------------------------------------------
If all the output values are the same we just insert a leaf with this
value.
Otherwise we follow the branches coming out of the current root.
%}


tabin
pause

create(tabin,1)

end
