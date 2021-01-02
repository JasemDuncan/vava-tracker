require 'rails_helper'

RSpec.describe TransactionsController, type: :routing do
  describe 'routing' do
    it 'Index page' do
      expect(get: '/transactions').to route_to('transactions#index')
    end

    it 'Show transaction' do
      expect(get: '/transactions/1').to route_to('transactions#show', id: '1')
    end

    it 'Create transaction' do
      expect(post: '/transactions').to route_to('transactions#create')
    end

    it 'New group' do
      expect(get: '/transactions/new').to route_to('transactions#new')
    end

    it 'Edit transaction' do
      expect(get: '/transactions/1/edit').to route_to('transactions#edit', id: '1')
    end

    it 'Update with put' do
      expect(put: '/transactions/1').to route_to('transactions#update', id: '1')
    end

    it 'Update with patch' do
      expect(patch: '/transactions/1').to route_to('transactions#update', id: '1')
    end

    it 'Destroy a transaction' do
      expect(delete: '/transactions/1').to route_to('transactions#destroy', id: '1')
    end
  end
end
