describe User do
  describe '#login' do
    let(:user) { User.new(params)}
    let(:params) { { name: '', age: age } }
    subject { user.login }
    context '' do
      let(:age) { 22 }
      it '' do
        is_expected.to eq ''
      end
    end
    context '' do
      let(:age) { 23 }
      it '' do
        is_expected.to eq ''
      end
    end
  end
end

#it: :example,specify
describe User do
  describe '#login' do
    let(:user) { User.new(params) }
    let(:params) { { name: '', age: age } }
    subject { user.login }
    context '' do
      let(:age) { 22 }
      it { is_expected.to eq '' }
    end
    context '' do
      let(:age) { 23 }
      it { is_expected.to eq '' }
    end
  end
end




