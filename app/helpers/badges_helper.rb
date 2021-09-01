module BadgesHelper
  def badge_header(badge)
    if badge.persisted?
      "Edit #{badge.title}"
    else
      'Create New achievement'
    end
  end
end