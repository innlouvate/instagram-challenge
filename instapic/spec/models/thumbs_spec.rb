require 'rails_helper'
require 'spec_helper'

describe Thumb, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:photo) }

end
