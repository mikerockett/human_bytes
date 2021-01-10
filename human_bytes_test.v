module human_bytes

fn test_can_convert() {
	assert convert(0) == '0 B'
	assert convert(0.4) == '0.4 B'
	assert convert(0.7) == '0.7 B'
	assert convert(10) == '10 B'
	assert convert(10.1) == '10.1 B'
	assert convert(999) == '999 B'
	assert convert(1001) == '1 kB'
	assert convert(1e16) == '10 PB'
	assert convert(1e30) == '1000000 YB'
}

fn test_supports_negatives() {
	assert convert(-0.4) == '-0.4 B'
	assert convert(-0.7) == '-0.7 B'
	assert convert(-10.1) == '-10.1 B'
	assert convert(-999) == '-999 B'
	assert convert(-1001) == '-1 kB'
}

fn test_supports_signed() {
	assert convert_opt(42, signed: true) == '+42 B'
	assert convert_opt(-13, signed: true) == '-13 B'
	assert convert_opt(0, signed: true) == ' 0 B'
}

fn test_supports_bits() {
	assert convert_opt(0, bits: true) == '0 b'
	assert convert_opt(0.4, bits: true) == '0.4 b'
	assert convert_opt(0.7, bits: true) == '0.7 b'
	assert convert_opt(10, bits: true) == '10 b'
	assert convert_opt(10.1, bits: true) == '10.1 b'
	assert convert_opt(999, bits: true) == '999 b'
	assert convert_opt(1001, bits: true) == '1 kbit'
	assert convert_opt(1e16, bits: true) == '10 Pbit'
	assert convert_opt(1e30, bits: true) == '1000000 Ybit'
}

fn test_supports_binary() {
	assert convert_opt(0, binary: true) == '0 B'
	assert convert_opt(4, binary: true) == '4 B'
	assert convert_opt(10, binary: true) == '10 B'
	assert convert_opt(10.1, binary: true) == '10.1 B'
	assert convert_opt(999, binary: true) == '999 B'
	assert convert_opt(1025, binary: true) == '1 kiB'
	assert convert_opt(1001, binary: true) == '1001 B'
	assert convert_opt(1e16, binary: true) == '8.88 PiB'
	assert convert_opt(1e30, binary: true) == '827180.61 YiB'
}

fn test_supports_bits_and_binary() {
	assert convert_opt(0, bits: true, binary: true) == '0 b'
	assert convert_opt(4, bits: true, binary: true) == '4 b'
	assert convert_opt(10, bits: true, binary: true) == '10 b'
	assert convert_opt(999, bits: true, binary: true) == '999 b'
	assert convert_opt(1025, bits: true, binary: true) == '1 kibit'
	assert convert_opt(1e6, bits: true, binary: true) == '976.56 kibit'
}
