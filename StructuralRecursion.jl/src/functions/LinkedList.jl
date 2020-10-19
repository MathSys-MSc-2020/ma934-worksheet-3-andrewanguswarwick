# Define list type
#mutable struct LinkedList
#    data::KeyValuePair
#    next::Union{LinkedList,Nothing}
#end

# Prepend data to list
function prepend(list::Union{LinkedList,Nothing}, data::KeyValuePair) 
    new = LinkedList(data, Nothing())
    new.next = list
    return new
end

# Append data to list
function append(list::Union{LinkedList, Nothing}, data::KeyValuePair) 
    if(list == Nothing())
        # Base case: this is the end of the list so add new node
        return LinkedList(data, Nothing())
    else
        # Recursive case: Append the data to the remainder of the list
        list.next = append(list.next, data)
        return list
    end
end

# Function to build a list from an array of Pair objects
function buildlist(dataArray::Array{KeyValuePair, 1})
    L = LinkedList(dataArray[1], Nothing())
    for i in 2:length(dataArray)
        L=append(L, dataArray[i])
    end
    return L
end

# Print all values greater than v in linked list
function selectiveprint( L::Union{LinkedList, Nothing}, v::Float64 )
    if(L == Nothing())
        # Base case: Return from function
        return
    else
        # Recursive case: Check if value greater than v and print
        if L.data.value > v
          println(L.data)
        end
        selectiveprint(L.next,v)
    end
end

# Search linked list for key
function search(list::Union{LinkedList, Nothing}, k::Int64)
    if(list == Nothing())
        # Base case: Return from function
        return Nothing
    else
        # Recursive case: Check if key matches input
        if list.data.key == k
          return list.data
        else
          search(list.next,k)
        end
    end

end

# Returns interval which random variable lies in
function intervalmembership(L::Union{LinkedList, Nothing}, x::Float64)
    if(L == Nothing())
        # Base case: Return from function
        return Nothing
    else
        # Recursive case: Check if float in interval
        if x < L.data.value
          return L.data
        else
          intervalmembership(L.next,x)
        end
    end
end
