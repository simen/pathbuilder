class UriBuilder
  def initialize(*args)
    @path = []
  end

  def [](*args)
    args.each do |arg|
      @path << arg
    end
    self
  end

  def method_missing(method, *args)
    @path << "#{method}"
    return handle_invocation(*args) unless args.empty?
    self
  end

  def handle_invocation(*args)
    # override this to handle invocations
  end

  def to_s
    result = "#{@path.join("/")}"
  end

  def inspect
    "#<#{self.class} #{self.to_s}>"
  end
end