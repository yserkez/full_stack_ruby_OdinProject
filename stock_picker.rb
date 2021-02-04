=begin
    Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
    It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

    EXAMPLE:
    > stock_picker([17,3,6,9,15,8,6,1,10])
    => [1,4]  # for a profit of $15 - $3 == $12

=end
def stock_picker (days)
    max_gain = 0
    best_days = [0,0]
    days.each_with_index do |forward_day,forward_index|
        days.to_enum.with_index.reverse_each do |reverse_day,reverse_index|
            break if forward_index == reverse_index
            if (reverse_day - forward_day > max_gain)
                max_gain = reverse_day - forward_day
                best_days = [forward_index,reverse_index]
            end
        end
    end
    p max_gain > 0 ? best_days : "Stick this one out bud"
end