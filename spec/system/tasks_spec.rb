# frozen_string_literal: true

require 'rails_helper'

describe 'タスク管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:task_a) { FactoryBot.create(:task, name: '最初のタスク', user: user_a) }

  before do
    # ユーザーAでログインする
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成したタスクが表示される' do
    it { expect(page).to have_content '最初のタスク' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成したタスクが表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit task_path(task_a)
      end

      it_behaves_like 'ユーザーAが作成したタスクが表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }
    let(:task_name) { '新規作成のテストを書く' }

    before do
      visit new_task_path
      fill_in '名称', with: task_name
      click_button '登録する'
    end

    context '新規作成画面で名称を入力したとき' do
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:task_name) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '名称を入力してください'
        end
      end
    end
  end

  describe 'タスク編集機能' do
    let(:login_user) { user_a }
    let(:task_name) { '編集済タスク' }

    before do
      visit task_path(task_a)
      click_on '編集'
      fill_in '名称', with: task_name
      click_button '更新する'
    end

    context '名称を編集したとき' do
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '更新しました'
      end
    end
  end

  describe '削除機能' do
    let(:login_user) { user_a }
    let(:task_delete) { FactoryBot.create(:task, name: '削除用タスク', user: user_a) }

    before do
      # 詳細ページに遷移する
      visit task_path(task_delete)
      # 削除ボタンを押す
      # ダイアログのOKを押す
      page.accept_confirm do
        click_on '削除'
      end
    end

    context '詳細画面から削除したとき' do
      it 'タスクが正常に削除される' do
        # 「タスク「削除用タスク」を削除しました。」というメッセージがあることを確認する
        expect(page).to have_selector '.alert-success', text: '削除用タスク'
      end
    end
  end

  # 難しいため、一旦保留
  # describe '削除機能' do
  #   let(:login_user) { user_a }
  #   let(:task_name) { '削除用のテストを書く' }
  #
  #   before do
  #     visit new_task_path
  #     fill_in '名称', with: task_name
  #     click_button '登録する'
  #   end
  #
  #   context '一覧画面で削除ボタンを押したとき' do
  #     it 'タスクが正常に削除される' do
  #       expect(page).to have_selector '.alert-success', text: '削除しました。'
  #     end
  #   end
  #
  #   context '詳細画面で削除ボタンを押したとき' do
  #     it 'タスクが正常に削除される' do
  #       # 詳細ページに遷移する
  #       visit task_path(task_a)
  #       # 削除ボタンを押す
  #       click_button '削除'
  #       # ダイアログのOKを押す
  #       page.accept_confirm do
  #         click_on 'OK'
  #       end
  #       # 「タスク「test」を削除しました。」というメッセージがあることを確認する
  #       expect(page).to have_selector '.alert-success', text: '削除用のテストを書く'
  #     end
  #   end
  # end

end
