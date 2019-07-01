require 'rails_helper'

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do 
        before do 
            user_a = FactoryBot.create(:user, name: 'ユーザー', email: 'a@example.com')
            FactoryBot.create(:task, name: '最初のタスク', user: user_a)
        end

        context 'ユーザーAがログインしている時' do 
            before do 
                visit login_path 
                fill_in 'mail', with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end

            it 'ユーザーAが作成したタスクが表示される' do 
                expect(page).to have_content 'タスク詳細'
            end
        end
    end
end