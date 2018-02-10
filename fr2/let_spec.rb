#Lazy evaluation

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

//
describe User do
  describe '' do
    let(:user){ User.new(params) }
    let(:params){ { name: '' } }
    context '' do
      before do
        params.merge!(age: 22)
      end
      it '' do
        expect(user.login).to eq ''
      end
    end
    context do
      before do
        params.merge!(age: 23)
      end
      it '' do
        expect(user.login).to eq ''
      end
    end
  end
end

//
descirbe User do
  describe '#login' do
    let(:user){ User.new(params) }
    let(:params) { { name: '', age: age } }
    context '' do
      let(:age) { 22 }
      it '' do
        expect(user.login).to eq ''
      end
    end
    context '' do
      let(:age) { 23 }
      it '' do
        expect(user.login).to eq ''
      end
    end
  end
end


