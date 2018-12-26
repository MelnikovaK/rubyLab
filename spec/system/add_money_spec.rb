RSpec.describe 'the money addition', type: :feature do
    it 'should not allow addition' do
      visit('/')
      click_on('Пополнить счет')
      fill_in('Фамилия вкладчика', with: 'Ivanov')
      fill_in('Номер счета', with: 12354)
      fill_in('Сумма пополнения', with: 400)
      click_on('Пополнить')
      expect(page).to have_content('Ivanov', '5400Р')
    end
    it 'should allow addition' do
        visit('/')
        click_on('Пополнить счет')
        fill_in('Фамилия вкладчика', with: 'Petrov')
        fill_in('Номер счета', with: 12334)
        fill_in('Сумма пополнения', with: 400)
        click_on('Пополнить')
        expect(page).to have_content('Petrov', '30400')
      end
  end
  