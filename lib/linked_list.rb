class LinkedListItem
  # include Comparable
  attr_reader :payload, :next_list_item

  def initialize(item)
    @payload = item
  end

  def next_list_item=(next_item)
    raise ArgumentError if next_item === self
    @next_list_item = next_item
  end

  def last?
    self.next_list_item.nil?
  end

  def >(linked_list_item)
    self.payload.to_s > linked_list_item.payload.to_s ? true : false
  end

  def <(linked_list_item)
    self.payload.to_s < linked_list_item.payload.to_s ? true : false
  end

  def ===(linked_list_item)
    self.object_id === linked_list_item.object_id ? true : false
  end

  def ==(linked_list_item)
    self.payload.to_s == linked_list_item.payload.to_s ? true : false
  end
end