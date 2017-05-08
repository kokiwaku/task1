module MypagesHelper
  
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_mypages_path
    elsif action_name == 'edit'
      mypage_path
    end
  end
    
end
