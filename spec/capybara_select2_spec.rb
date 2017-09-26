require 'spec_helper'

describe CapybaraSelect2 do
  it 'has a version number' do
    expect(CapybaraSelect2::VERSION).not_to be nil
  end

  shared_context 'with select2 version 3.x.x' do |options = {}|
    before { visit 'select2-v3.x.x/index.html' }

    context 'selecting a value from a single select box', driver: options[:driver] do

      it 'identified by XPath' do
        select2 'XBox', xpath: '//div[@id="s2id_console"]'
        expect(page).to have_css '.select2-chosen', text: 'XBox'
      end

      it 'identified by CSS selector' do
        select2 'XBox', css: '#s2id_console'
        expect(page).to have_css '.select2-chosen', text: 'XBox'
      end

      it 'identified by label' do
        select2 'XBox', from: 'Select game console'
        expect(page).to have_css '.select2-chosen', text: 'XBox'
      end
    end
  end

  include_context 'with select2 version 3.x.x'
  include_context 'with select2 version 3.x.x', driver: :webkit
end
