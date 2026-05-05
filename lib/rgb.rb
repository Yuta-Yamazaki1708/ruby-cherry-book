# frozen_string_literal: true

# １０進数を16進数カラーコードに変換するインスタンスメソッドと、その逆インスタンスメソッドを持つ
class RGB
  HEX_RANGE = (0..255).freeze
  private_constant :HEX_RANGE
  def to_hex(ary)
    validate_array(ary)

    ary.sum('#') { |n| n.to_s(16).rjust(2, '0') }
  end

  def to_int(str)
    validate_string(str)
    validate_color_code(str)

    str[1..].scan(/.{2}/).map(&:hex)
  end

  private

  def validate_array(ary)
    return if ary.is_a?(Array) &&
              ary.size == 3 &&
              ary.all? { |n| n.is_a?(Integer) && HEX_RANGE.cover?(n) }

    raise ArgumentError, 'Invalid Argument: 3要素ある配列で、全ての要素が0から255の整数である必要があります'
  end

  def validate_string(str)
    return if str.is_a?(String)

    raise ArgumentError, 'Invalid Argument: 文字列である必要があります'
  end

  def validate_color_code(str)
    return if /\A#[0-9a-fA-F]{6}\z/.match?(str)

    raise ArgumentError, 'Invalid Argument: 1文字目が#かつ6桁の16進数の文字列である必要があります'
  end
end
