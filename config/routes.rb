ActionController::Routing::Routes.draw do |map|

  map.resources :communities, :conditions => { :subdomain => '' }

  map.login '/login', :controller => "sessions", :action => 'new', :conditions => { :subdomain => /./ }
  map.logout '/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :subdomain => /./ }
  map.signup '/signup', :controller => 'users', :action => 'signup', :conditions => { :subdomain => /./ }

  map.resources :sessions, :conditions => { :subdomain => /./ }
  map.resources :users, :member => { :email => :any }, :conditions => { :subdomain => /./ }
  map.resources :discussions, :conditions => { :subdomain => /./ } do | discussions |
    discussions.resources :responses, :conditions => { :subdomain => /./ } 
  end
  
  map.resources :courses, :conditions => { :subdomain => /./ } do | courses |
    courses.resources :chapters, :conditions => { :subdomain => /./ } do | chapters |
      chapters.resources :lessons, :conditions => { :subdomain => /./ }
    end
  end

  map.root :controller => "home", :conditions => { :subdomain => '' }
  map.community_home '', :controller => "communities", :action => 'show', :conditions => { :subdomain => /./ }
  map.community_no_longer_active 'no_longer_active', :controller => "communities", :action => 'no_longer_active', :conditions => { :subdomain => /./ }

  map.edit_community 'community/edit', :controller => 'admin', :action => 'edit_community', :conditions => { :subdomain => /./ }

end
