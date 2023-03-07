Rails.application.routes.draw do
  post 'events/report', to: 'events#report'
end
