module human_bytes

import math { floor, is_inf, log, log10, min, pow }
import strconv { format_fl }

const (
	binary_bit_units  = ['b', 'kibit', 'Mibit', 'Gibit', 'Tibit', 'Pibit', 'Eibit', 'Zibit', 'Yibit']
	binary_byte_units = ['B', 'kiB', 'MiB', 'GiB', 'TiB', 'PiB', 'EiB', 'ZiB', 'YiB']
	bit_units         = ['b', 'kbit', 'Mbit', 'Gbit', 'Tbit', 'Pbit', 'Ebit', 'Zbit', 'Ybit']
	byte_units        = ['B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
)

fn format(prefix string, value f64, precision int) string {
	return prefix + format_fl(value, rm_tail_zero: true, len1: precision)
}

fn display_unit(units []string, index f64) string {
	return ' ${units[index]}'
}

struct Options {
	bits      bool
	binary    bool
	signed    bool
	precision int = 2
}

pub fn convert(input_val f64) string {
	return convert_opt(input_val, {})
}

pub fn convert_opt(input_val f64, options Options) string {
	mut value := input_val

	units := if options.binary {
		if options.bits { human_bytes.binary_bit_units } else { human_bytes.binary_byte_units }
	} else {
		if options.bits { human_bytes.bit_units } else { human_bytes.byte_units }
	}

	if is_inf(input_val, 0) {
		return format('', 0, options.precision) + display_unit(units, 0)
	}

	if options.signed && value == 0 {
		return format(' ', 0, options.precision) + display_unit(units, 0)
	}

	negative := value < 0

	prefix := if negative {
		'-'
	} else {
		if options.signed { '+' } else { '' }
	}

	if negative {
		value = -value
	}

	if value < 1 {
		return format(prefix, value, options.precision) + display_unit(units, 0)
	}

	floored := floor(if options.binary { log(value) / log(1024) } else { log10(value) / 3 })
	exponent := min(floored, units.len - 1)
	value /= pow(if options.binary { 1024 } else { 1000 }, exponent)

	return format(prefix, value, options.precision) + display_unit(units, exponent)
}
