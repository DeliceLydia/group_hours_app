module GroupingsHelper
  def total_hours(_groupings)
    sum = 0
    @groupings.each do |grouping|
      sum += grouping.hours
    end
    sum
  end
end
