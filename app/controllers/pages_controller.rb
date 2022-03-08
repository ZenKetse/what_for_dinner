class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hide_topnav = true

    @hide_bottomnav = true
  end

end
