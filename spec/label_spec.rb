require_relative '../book/label'

describe Label do
  it 'instance of Label class' do
    label = Label.new('label', 'red')
    expect(label).to be_an_instance_of(Label)
  end

  it 'title be equal ' do
    label = Label.new('label', 'red')
    expect(label.title).to eq('label')
  end

  it 'color be equal ' do
    label = Label.new('label', 'red')
    expect(label.color).to eq('red')
  end
end
