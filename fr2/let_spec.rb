describe User do
  describe '' do
    let(:params){ { name: '' } }
    context '' do
      before
        params.merge!(age: 22)
      end
      it '' do
        user = User.new(params)
	expect(user.login).to eq ''
      end
    end
    context '' do
      before do
        params.merge(age: 23)
      end
      it '' do
        user = User.new(params)
	expect(user.login).to eq ''
      end
    end
  end
end

