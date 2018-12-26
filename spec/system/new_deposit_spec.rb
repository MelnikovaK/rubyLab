RSpec.describe 'the deposit addition', type: :feature do
  it 'should allow addition' do
    visit('/')
    click_on('Добавить тип вклада')
    fill_in('Тип', with: 'Family')
    fill_in('Процент', with: 7)
    page.select 'Да', from: 'Возможность пополнения'
    click_on('Добавить')
    expect(page).to have_content('Family')
  end
  it 'should allow addition' do
    visit('/')
    click_on('Добавить тип вклада')
    fill_in('Тип', with: 'Мега')
    fill_in('Процент', with: 12)
    page.select 'Нет', from: 'Возможность пополнения'
    click_on('Добавить')
    expect(page).to have_content('Family')
  end
end
