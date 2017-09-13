shared_context 'record save failure' do
  before { allow_any_instance_of(ActiveRecord::Base).to receive(:save) { false } }
end
