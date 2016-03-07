require 'rails_helper'
require 'spec_helper'

describe Photo, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :thumbs }

  it { should have_many(:comments).dependent(:destroy) }

  it { should belong_to(:user) }

end
