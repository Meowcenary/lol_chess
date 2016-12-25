require 'spec_helper'

describe Tile do
  it 'when no piece on tile #occupied returns nil' do
    params  = { position: 1 }
    subject = described_class.new(params)

    expect(subject.occupied).to be(nil)
  end

  it 'when piece on tile #occupied returns that piece' do
    params  = { position: 1, piece: 'piece' }
    subject = described_class.new(params)

    expect(subject.occupied).to eq(subject.piece)
  end
end
