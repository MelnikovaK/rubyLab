RSpec.describe 'the deposit closing', type: :feature do
  it 'should close the deposit and return the money' do
    visit('/close')
    fill_in('Номер счета', with: 987656)
    click_on('Закрыть')
    expect(page).to have_content('8.03')
    end
end
  