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

    @current_item.next_list_item = lli if @current_item
    @current_item = lli

    @head = lli if @count == 0

    @count += 1
  end

  def get(index)
    raise IndexError if index < 0
    raise IndexError if index >= @count
    tmp = @head
    index.times do
      tmp = tmp.next_list_item
    end
    tmp.payload
  end

end