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
    if (self.payload.class == Symbol and linked_list_item.payload.class != Symbol) or (self.payload.class != Symbol and linked_list_item.payload.class == Symbol)
      self.payload.class == Symbol ? true : false
    elsif (self.payload.class == Fixnum or linked_list_item.payload.class == Fixnum) or (self.payload.class != Fixnum and linked_list_item.payload.class == Fixnum)
      self.payload.class == Fixnum ? false : true
    else
      self.payload > linked_list_item.payload ? true : false
    end
  end

  def <(linked_list_item)
    if (self.payload.class == Symbol and linked_list_item.payload.class != Symbol) or (self.payload.class != Symbol and linked_list_item.payload.class == Symbol)
      self.payload.class == Symbol ? false : true
    elsif (self.payload.class == Fixnum and linked_list_item.payload.class != Fixnum) or (self.payload.class != Fixnum and linked_list_item.payload.class == Fixnum)
      self.payload.class == Fixnum ? true : false
    else
      self.payload < linked_list_item.payload ? true : false
    end
  end

  def ===(linked_list_item)
    self.object_id === linked_list_item.object_id ? true : false
  end

  def ==(linked_list_item)
    self.payload == linked_list_item.payload ? true : false
  end
end