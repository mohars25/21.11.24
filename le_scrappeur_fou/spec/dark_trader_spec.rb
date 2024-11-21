require_relative '../lib/dark_trader'

describe 'fetch_crypto_data' do
  it 'retourne un array non vide' do
    expect(fetch_crypto_data).not_to be_empty
  end

  it 'contient des hashs avec une clé et une valeur' do
    data = fetch_crypto_data
    expect(data.first).to be_a(Hash)
    expect(data.first.keys.first).to be_a(String)
    expect(data.first.values.first).to be_a(Float)
  end
end

