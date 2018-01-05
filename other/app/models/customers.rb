before_validation do
  emails.each_with_index do |e0, i|
    emails.each_with_index do |31, j|
      next if i == j || e0.address.blank?
      if e0.address.downcase == e1.address.try(:downcase)
        emails[i].duplicated = true
      end
      if e0.address.downcase == e1.address_was.try(:downcase)
        emails[i].exchanging = true
      end
    end
  end
end

