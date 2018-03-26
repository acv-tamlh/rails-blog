require 'rails_helper'

describe 'CRUD Image', type: :feature do
  let!(:image) { create(:image) }
  context 'create Image' do
    it 'good params' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      find(:link, 'Add image').click
      expect(page).to have_content 'New image'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: '3'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Image was successfully created.')
    end
    it 'bad params' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      find(:link, 'Add image').click
      expect(page).to have_content 'New image'
      fill_in 'Headline', with: ''
      click_on 'submit'
      expect(page).to have_selector('p.alert.text-danger', 'Create fail')
    end
  end
  context 'read Image' do
    it 'good params' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      expect(page).to have_content image.like
      expect(page).to have_content image.url_image
    end
  end
  context 'update Image' do
    it 'good params' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      first('.image').click_link('edit')
      expect(page).to have_content 'Edit image'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: '3'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Image was successfully updated.')
    end
    it 'bad params headline' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      first('.image').click_link('edit')
      expect(page).to have_content 'Edit image'
      fill_in 'Headline', with: ''
      fill_in 'Order', with: '3'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Update fail')
    end
    it 'bad params order' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      first('.image').click_link('edit')
      expect(page).to have_content 'Edit image'
      fill_in 'Headline', with: 'Headline'
      fill_in 'Order', with: 'asdas'
      click_on 'submit'
      expect(page).to have_selector('p.notice.text-success', 'Update fail')
    end
  end
  context 'delete image' do
    it 'good params' do
      visit 'articles/'
      find(:link, Image.last.article.title).click
      expect(page).to have_content image.headline
      first('.image').click_link('delete')
      expect(page).to have_selector('p.notice.text-success', 'Delete sucessfully')
    end
end
end
