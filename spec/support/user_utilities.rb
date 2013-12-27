def login_with(resource)
  namespace = resource.class.to_s.downcase

  visit "/#{namespace.pluralize}/sign_in"

  fill_in "#{namespace}[email]", with: resource.email
  fill_in "#{namespace}[password]", with: "123123123"

  click_button 'Sign in'
  
end