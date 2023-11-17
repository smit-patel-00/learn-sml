fun allChangeHelp(coins, coinvals, 0, acc) = coins::acc
| allChangeHelp(coins, [], amount, acc) = acc
| allChangeHelp(coins, c::coinvals, amount, acc) =
    if amount < 0 then acc
    else allChangeHelp(coins, coinvals, amount, allChangeHelp(c::coins, c::coinvals, amount-c, acc));

fun allChange(coins, coinvals, amount) =
    allChangeHelp(coins, coinvals, amount, []);


allChange([], [5,2], 16);
allChange([], [25,10,2,1], 43);