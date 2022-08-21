require 'rails_helper' # 設定ファイルrails_helper.rbを読み込むコードが全テストにあります

RSpec.describe User, type: :model do
  it "Userモデルをnewしたとき, nilでないこと" do
    expect(User.new).not_to eq(nil)
  end
end