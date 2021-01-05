module ErrorsSupport
  def errors(item, id, message)
    item.id = nil
    item.valid?
    binding.pry
    expect(item.errors.full_messages).to include(message)
  end
end
