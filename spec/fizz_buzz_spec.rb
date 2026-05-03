# frozen_string_literal: true

require 'spec_helper'
require 'stringio'
require_relative '../lib/fizz_buzz'

RSpec.describe 'fizz_buzz' do # rubocop:disable RSpec/DescribeClass
  around do |example|
    original_stdin = $stdin
    example.run
  ensure
    $stdin = original_stdin
  end

  context 'exitが入力された場合' do
    before do
      $stdin = StringIO.new("exit\n")
    end

    it '終了すること' do
      expect { fizz_buzz }.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
    end
  end

  context '数字以外が入力された場合' do
    before do
      $stdin = StringIO.new("string\nexit\n")
    end

    it 'メッセージが表示され、ループすること' do
      expect { fizz_buzz }.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\n数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
    end
  end

  context '数字が入力された場合' do
    context '3の倍数が入力された場合' do
      before do
        $stdin = StringIO.new("3\nexit\n")
      end

      it 'fizzが出力されること' do
        expect do
          fizz_buzz
        end.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\nfizz\n数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
      end
    end

    context '5の倍数が入力された場合' do
      before do
        $stdin = StringIO.new("5\nexit\n")
      end

      it 'buzzが出力されること' do
        expect do
          fizz_buzz
        end.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\nbuzz\n数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
      end
    end

    context '15の倍数が入力された場合' do
      before do
        $stdin = StringIO.new("15\nexit\n")
      end

      it 'fizz_buzzが出力されること' do
        expect do
          fizz_buzz
        end.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\nfizz_buzz\n数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
      end
    end
  end

  context 'それ以外が入力された場合' do
    before do
      $stdin = StringIO.new("1\nexit\n")
    end

    it 'メッセージが表示され、ループすること' do
      expect { fizz_buzz }.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\n数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
    end
  end

  context '入力がなかった場合' do
    before do
      $stdin = StringIO.new
    end

    it '終了すること' do
      expect { fizz_buzz }.to output("数字を入力してください。(#{EXIT_COMMAND}で終了)\n").to_stdout
    end
  end
end
