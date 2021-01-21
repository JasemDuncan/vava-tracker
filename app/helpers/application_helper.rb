module ApplicationHelper
  def transaction_image(group_id)
    if !group_id.blank?
      image_tag url_for(Group.find_by(id: group_id).image)
    else

      image_tag 'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png', class: 'w-80'
    end
  end
end
