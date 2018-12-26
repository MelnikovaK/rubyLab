RSpec.describe 'the fraction addition', type: :feature do
  it 'should allow addition' do
    visit('/')
    click_on('Добавить вкладчика')
    fill_in('Фамилия вкладчика', with: 'Смирнов')
    fill_in('Имя вкладчика', with: 'Семен')
    fill_in('Отчество вкладчика', with: 'Олегович')
    fill_in('Номер вклада', with: 987656)
    fill_in('Сумма вклада', with: 3400)
    page.select 'Travel', from: 'Тип вклада'
    page.select '2016', from: 'Год открытия'
    click_on('Добавить')
    expect(page).to have_content('Смирнов', '3400Р')
  end
end
