describe User do
  describe '#login' do
    before do
      @params = { name: '' }
    end

    context '' do
      before do
        @params.merge!(age: 23)
      end
      it '' do
        user = User.new(@params)
	expect(user.greet).to eq ''
      end
    end
    context '' do
      before do
        @params.merge!(age: 24)
      end
      it '' do
        user = User.new(@params)
	expect(user.login).to eq ''
      end
    end
  end
end

