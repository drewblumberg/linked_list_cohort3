require 'linked_list_item'

class LinkedList

  def initialize
    @count = 0
    @head = nil
    @current_item = nil
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    lli.next_list_item = nil

    @current_item.next_list_item = lli if @current_item
    @current_item = lli

    @head = lli if @count == 0

    @count += 1
  end

  def get(index)
    tmp = @head
    index.times do
      tmp = tmp.next_list_item
    end
    tmp.payload
  end

end