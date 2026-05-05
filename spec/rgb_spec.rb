# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/rgb'

RSpec.describe RGB do
  let(:rgb) { described_class.new }

  it '[0, 0, 0]を#000000に変換できること' do
    hex1 = rgb.to_hex([0, 0, 0])
    expect(hex1).to eq('#000000')
  end

  it '[255, 255, 255]を#ffffffに変換できること' do
    hex2 = rgb.to_hex([255, 255, 255])
    expect(hex2).to eq('#ffffff')
  end

  it '#000000を[0, 0, 0]に変換できること' do
    int1 = rgb.to_int('#000000')
    expect(int1).to eq([0, 0, 0])
  end

  it '#ffffffを[255, 255, 255]に変換できること' do
    int2 = rgb.to_int('#ffffff')
    expect(int2).to eq([255, 255, 255])
  end
end
