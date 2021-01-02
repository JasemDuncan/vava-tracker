require 'rails_helper'

RSpec.describe GroupsController, type: :routing do
  describe 'Routes' do
    it 'Index page' do
      expect(get: '/groups').to route_to('groups#index')
    end

    it 'Show groups' do
      expect(get: '/groups/1').to route_to('groups#show', id: '1')
    end

    it 'Create a group' do
      expect(post: '/groups').to route_to('groups#create')
    end

    it 'New group' do
      expect(get: '/groups/new').to route_to('groups#new')
    end

    it 'Edit  a group' do
      expect(get: '/groups/1/edit').to route_to('groups#edit', id: '1')
    end

    it 'Update with put' do
      expect(put: '/groups/1').to route_to('groups#update', id: '1')
    end

    it 'Update with patch' do
      expect(patch: '/groups/1').to route_to('groups#update', id: '1')
    end

    it 'Destroy a group' do
      expect(delete: '/groups/1').to route_to('groups#destroy', id: '1')
    end
  end
end
