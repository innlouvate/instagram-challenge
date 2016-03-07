def sign_up(email: 'test@example.com', password: 'testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def sign_in(email: 'test@example.com', password: 'testtest')
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Log in')
end

def sign_up_and_add_photo
  sign_up
  visit '/photos'
  click_link 'Add a photo'
  fill_in 'Name', with: 'My photo'
  click_button 'Create Photo'
  click_link('Sign out')
end

# def leave_comment(thoughts)
#   sign_in
#   visit '/photos'
#   click_link 'Comment'
#   fill_in 'Comments', with: thoughts
#   click_button 'Leave comment'
#   click_link 'Sign out'
# end
