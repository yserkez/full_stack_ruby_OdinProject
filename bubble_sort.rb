=begin

    Build a method #bubble_sort that takes an array and returns a sorted array.
    It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

    EXAMPLE:
    > bubble_sort([4,3,78,2,0,2])
    => [0,2,2,3,4,78]

=end
def bubble_sort items, index = 0
    return items if items.length == index -1
    items.each_with_index do |item, index|
        if items[index + 1] && item > items[index + 1]
            items[index] = items[index + 1]
            items[index + 1] = item
        end
    end
    return bubble_sort(items,index + 1)
end