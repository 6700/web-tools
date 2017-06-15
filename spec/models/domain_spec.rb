require 'rails_helper'

RSpec.describe Domain, type: :model do
  %W(hola.com.ar hola.com hola.net test.net prueba.tk).each do |domain|
    context "with #{domain} as name" do
      let!(:name) { domain }
      it { should be_valid }
    end
  end

  %W(test palabra . jamon.cm).each do |domain|
    context "with #{domain} as name" do
      let!(:name) { domain }
      it { should_not be_valid }
    end
  end

  let!(:user) { create(:user) }

  subject do
    Domain.new(name: name, user: user)
  end
end
