HEX_RANGE = (0..255).freeze

# １０進数を16進数カラーコードに変換するインスタンスメソッドと、その逆インスタンスメソッドを持つ
class RGB
  def to_hex(ary)
    validate_array(ary)

    ary.sum('#') { |n| n.to_s(16).rjust(2, '0') }
  end

  def to_int(str)
    validate_string(str)
    parsed = parse_string(str)
    validate_color_code(parsed)

    parsed[1].scan(/.{2}/).map(&:hex)
  end

  private

  def validate_array(ary)
    return if ary.is_a?(Array) &&
              ary.size == 3 &&
              ary.all? { |n| n.is_a?(Integer) && HEX_RANGE.cover?(n) }

    raise ArgumentError, 'Invalid Error: 3要素ある配列で、全ての要素が0から255の整数である必要があります'
  end

  def validate_string(str)
    return if str.is_a?(String)

    raise ArgumentError, 'Invalid Error: 文字列である必要があります'
  end

  def validate_color_code(parsed)
    return if parsed[0] == '#' &&
              /\A[0-9a-f]{6}\z/.match?(parsed[1])

    raise ArgumentError, 'Invalid Error: 1文字目が#かつ6桁の16進数の文字列である必要があります'
  end

  def parse_string(str)
    [str[0], str[1..]]
  end
end
