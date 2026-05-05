# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/rgb'

RSpec.describe RGB do
  let(:rgb) { described_class.new }

  describe 'to_hexメソッド' do
    it '[0, 0, 0]を#000000に変換できること' do
      hex1 = rgb.to_hex([0, 0, 0])
      expect(hex1).to eq('#000000')
    end

    it '[255, 255, 255]を#ffffffに変換できること' do
      hex2 = rgb.to_hex([255, 255, 255])
      expect(hex2).to eq('#ffffff')
    end
  end

  describe 'to_intメソッド' do
    it '#000000を[0, 0, 0]に変換できること' do
      int1 = rgb.to_int('#000000')
      expect(int1).to eq([0, 0, 0])
    end

    it '#ffffffを[255, 255, 255]に変換できること' do
      int2 = rgb.to_int('#ffffff')
      expect(int2).to eq([255, 255, 255])
    end

    it '#FFFFFFを[255, 255, 255]に変換できること' do
      int3 = rgb.to_int('#FFFFFF')
      expect(int3).to eq([255, 255, 255])
    end
  end

  describe 'validate_arrayメソッド' do
    context '配列でなかった場合' do
      it 'ArgumentErrorが返ること' do
        expect { rgb.to_hex('test') }.to raise_error(ArgumentError)
      end
    end

    context '要素数が3でなかった場合' do
      it 'ArgumentErrorが返ること' do
        expect { rgb.to_hex([0, 0]) }.to raise_error(ArgumentError)
      end
    end

    context '全ての要素が0から255の整数でなかった場合' do
      it 'ArgumentErrorが返ること' do
        expect { rgb.to_hex([0, 300, 255]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'validate_stringメソッド' do
    context '文字列でなかった場合' do
      it 'ArgumentErrorが返ること' do
        expect { rgb.to_int(123) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'validate_color_codeメソッド' do
    context '正規表現にマッチしなかった場合' do
      it 'ArgumentErrorが返ること' do
        expect { rgb.to_int('#hogehoge') }.to raise_error(ArgumentError)
      end
    end
  end
end
