require 'linked_list_item'

class LinkedList

  def initialize(*args)
    @count = 0
    @head = nil
    @current_item = nil

    if(args)
      args.each do |list_item|
        add_item(list_item)
      end
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)

    @head = lli if @count == 0

    @current_item.next_list_item = lli if @current_item
    @current_item = lli

    @count += 1
  end

  def get(index, get_list_item=false)
    raise IndexError if index < 0
    raise IndexError if index >= @count
    tmp = @head
    index.times do
      tmp = tmp.next_list_item
    end
    return tmp.payload unless get_list_item
    return tmp
  end

  def [](index, get_list_item=false)
    get_list_item ? get(index, true) : get(index, false)
  end

  def []=(index, payload)
    tmp = get(index, true)
    tmp.payload = payload
  end

  def size
    @count
  end

  def last
    @current_item.payload if @current_item
  end

  def to_s
    return "| |" if @count == 0

    list_items = "| "
    i = 0
    while (i < @count)
      list_items = list_items + get(i)
      list_items = list_items + ', ' if i != @count-1
      i += 1
    end

    list_items = list_items + " |"
  end

  def remove(index)
    self[index] = nil

    if (index > 0 and index < (@count-1))
      prev = self[index-1, true]
      prev.next_list_item = self[index+1, true]
    end

    @head = self[1, true] if index == 0

    @count -= 1
  end

  def indexOf(payload)
    i = 0
    while i < @count do
      found = true if self[i] == payload
      break if found
      i += 1
    end

    return i if found
  end
end