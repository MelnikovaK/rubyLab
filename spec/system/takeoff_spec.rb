RSpec.describe 'the procent takeoff', type: :feature do
    it 'should return the money' do
        visit('/takeoff')
        fill_in('Номер счета', with: 12334)
        click_on('Снять')
        expect(page).to have_content('11204.48')
      end
  end
  