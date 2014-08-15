module PlayersHelper

  def follow_button(player)
    if user_signed_in?
      if current_user.following?(player)
        link_to unfollow_player_path(player), class: 'GrepoliaButton' do
          "<i class='fa fa-check-square-o'></i> &nbsp; Following".html_safe
        end
      else
        link_to follow_player_path(player), class: 'GrepoliaButton' do
          "<i class='fa fa-square-o'></i> &nbsp; Follow".html_safe
        end
      end
    end
  end

end
