class PathBuilder
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
    # Preserve path between separate invocations
    prior_path = @path.dup
    @path << "#{method}"
    unless args.empty?
      if args.length == 1 && args.first.respond_to?(:keys) # is_a?(Hash)
        result = handle_invocation(*args)
      else
        @path += args
        result = handle_invocation
      end
      @path = prior_path
      return result
    end
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