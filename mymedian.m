function val = mymedian(arr)

    sortedArray = sort(arr, 'ascend');
    numElems    = numel(sortedArray);
    if mod(numElems,2) == 0
        val = sortedArray(numElems/2 + 1);
    else
        val = sortedArray((numElems+1)/2);
    end

end